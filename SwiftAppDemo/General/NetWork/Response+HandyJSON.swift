//
//  Response+HandyJSON.swift
//  SwiftAppDemo
//
//  Created by 岑志军 on 2019/6/13.
//  Copyright © 2019 岑志军. All rights reserved.
//

import Foundation
import Moya
import HandyJSON
import RxSwift

extension Response{
    
    //配置data数据
    func map<D:HandyJSON>(dataModel:D.Type) throws ->  ZJBaseModel{
        
        do {
            try _ = self.filterSuccessfulStatusCodes()
            
            return try self.dealMapData(propertyModel:ZJEmptyModel.self , dataModel: dataModel)
            
        } catch  MoyaError.statusCode(self){
            throw MoyaError.statusCode(self)
        }
    }
    
    //配置property数据
    func map<P:HandyJSON>(propertyModel:P.Type) throws ->  ZJBaseModel{
        
        do {
            _ = try self.filterSuccessfulStatusCodes()
            return try self.dealMapData(propertyModel: propertyModel, dataModel: ZJEmptyModel.self)
        } catch  MoyaError.statusCode(self){
            
            throw MoyaError.statusCode(self)
        }
    }
    
    //property 和 data 都配置
    func map<D:HandyJSON,P:HandyJSON>(propertyModel:P.Type ,dataModel:D.Type) throws ->  ZJBaseModel{
        
        do {
            _ = try self.filterSuccessfulStatusCodes()
            return try self.dealMapData(propertyModel: propertyModel, dataModel: dataModel)
        }catch MoyaError.statusCode(self){
            
            throw MoyaError.statusCode(self)
        }
    }
    
    
    //property 和 data都不配置
    func map() throws ->  ZJBaseModel{
        do {
            _ = try self.filterSuccessfulStatusCodes()
            return try self.dealMapData(propertyModel: ZJEmptyModel.self, dataModel: ZJEmptyModel.self)
        }catch MoyaError.statusCode(self){
            throw MoyaError.statusCode(self)
        }
    }
    
    //返回JSON
    func mapJson() throws -> JSON{
        
        do{
            _ = try self.filterSuccessfulStatusCodes()
            let data = try? mapJSON()
            if data != nil{
                let json = JSON(data!)
                return json
            }
            return JSON()
        }catch MoyaError.statusCode(self){
            throw MoyaError.statusCode(self)
        }
    }
    
    //处理data和property数据
    func dealMapData<D:HandyJSON,P:HandyJSON>(propertyModel:P.Type,dataModel:D.Type) throws -> ZJBaseModel {
        
        let data = try? mapJSON()
        var baseModel:ZJBaseModel = ZJBaseModel()
        
        //如果data为空
        if data == nil{
            baseModel.status = ZJStatusModel()
            baseModel.page = ZJPageModel()
            baseModel.property = P()
            baseModel.data = [D]()
            baseModel.dataModel = D()
            return baseModel
        }
        
        let json = JSON(data!)
        
        //配置status数据
        if let statusModel = ZJStatusModel.deserialize(from: json["status"].description){
            baseModel.status = statusModel
        }else {
            baseModel.status = ZJStatusModel()
        }
        
        //status的Code码发生错误后 抛出异常
        switch baseModel.status?.code {
        case "1":
            let response = Response.init(statusCode: 1, data: Data())
            throw MoyaError.statusCode(response)
        case "2":
            let response = Response.init(statusCode: 2, data: Data())
            throw MoyaError.statusCode(response)
            //        case "3":
            //            let response = Response.init(statusCode: 3, data: Data())
        //            throw MoyaError.statusCode(response)
        case "4":
            let response = Response.init(statusCode: 4, data: Data())
            throw MoyaError.statusCode(response)
        default:
            break
        }
        
        //配置page数据
        if let pageModel = ZJPageModel.deserialize(from: json["page"].description){
            
            baseModel.page = pageModel
        }else {
            baseModel.page = ZJPageModel()
        }
        
        //配置property数据
        if propertyModel is ZJEmptyModel.Type{
            
            baseModel.property = json["property"]
            
        }else{
            
            if let propertyModel = P.deserialize(from: json["property"].description){
                baseModel.property = propertyModel
            }else {
                baseModel.property = P()
            }
        }
        
        //配置data数据
        if dataModel is ZJEmptyModel.Type{
            
        }else{
            if let dataArr = JSONDeserializer<D>.deserializeModelArrayFrom(json: json["data"].description){
                baseModel.data = dataArr as [Any]
                if let dataModel = dataArr.first{
                    baseModel.dataModel = dataModel
                }else {
                    baseModel.dataModel = D()
                }
            }else {
                baseModel.data = [D]()
                baseModel.dataModel = D()
            }
        }
        return baseModel
    }
}

extension PrimitiveSequence where TraitType == SingleTrait, ElementType == Response{
    
    func map<D:HandyJSON,P:HandyJSON>(propertyModel:P.Type ,dataModel:D.Type) ->  Single<ZJBaseModel>{
        return flatMap { response -> Single<ZJBaseModel> in
            return Single.just(try response.map(propertyModel: propertyModel, dataModel: dataModel))
        }
    }
    
    func map<D:HandyJSON>(dataModel:D.Type) ->  Single<ZJBaseModel>{
        return flatMap { response -> Single<ZJBaseModel> in
            return Single.just(try response.map(dataModel: dataModel))
        }
    }
    
    func map<P:HandyJSON>(propertyModel:P.Type) -> Single<ZJBaseModel>{
        return flatMap { response -> Single<ZJBaseModel> in
            return Single.just(try response.map(propertyModel: propertyModel))
        }
    }
    
    func map() -> Single<ZJBaseModel>{
        return flatMap { response -> Single<ZJBaseModel> in
            return Single.just(try response.map())
        }
    }
    
    func mapJson() -> Single<JSON>{
        return flatMap { response -> Single<JSON> in
            return Single.just(try response.mapJson())
        }
    }
    
}
