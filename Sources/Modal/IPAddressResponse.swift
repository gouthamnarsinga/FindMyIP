//
//  IPAddressResponse.swift
//  FindMyIP
//
//  Created by Danush on 30/03/24.
//

import Foundation

struct IPAddressResponse : Codable {
    let ip : String?
    let network : String?
    let version : String?
    let city : String?
    let region : String?
    let region_code : String?
    let country : String?
    let country_name : String?
    let country_code : String?
    let country_code_iso3 : String?
    let country_capital : String?
    let country_tld : String?
    let continent_code : String?
    let in_eu : Bool?
    let postal : String?
    let latitude : Double?
    let longitude : Double?
    let timezone : String?
    let utc_offset : String?
    let country_calling_code : String?
    let currency : String?
    let currency_name : String?
    let languages : String?
    let country_area : Double?
    let country_population : Int?
    let asn : String?
    let org : String?

    enum CodingKeys: String, CodingKey {

        case ip = "ip"
        case network = "network"
        case version = "version"
        case city = "city"
        case region = "region"
        case region_code = "region_code"
        case country = "country"
        case country_name = "country_name"
        case country_code = "country_code"
        case country_code_iso3 = "country_code_iso3"
        case country_capital = "country_capital"
        case country_tld = "country_tld"
        case continent_code = "continent_code"
        case in_eu = "in_eu"
        case postal = "postal"
        case latitude = "latitude"
        case longitude = "longitude"
        case timezone = "timezone"
        case utc_offset = "utc_offset"
        case country_calling_code = "country_calling_code"
        case currency = "currency"
        case currency_name = "currency_name"
        case languages = "languages"
        case country_area = "country_area"
        case country_population = "country_population"
        case asn = "asn"
        case org = "org"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        ip = try values.decodeIfPresent(String.self, forKey: .ip)
        network = try values.decodeIfPresent(String.self, forKey: .network)
        version = try values.decodeIfPresent(String.self, forKey: .version)
        city = try values.decodeIfPresent(String.self, forKey: .city)
        region = try values.decodeIfPresent(String.self, forKey: .region)
        region_code = try values.decodeIfPresent(String.self, forKey: .region_code)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        country_name = try values.decodeIfPresent(String.self, forKey: .country_name)
        country_code = try values.decodeIfPresent(String.self, forKey: .country_code)
        country_code_iso3 = try values.decodeIfPresent(String.self, forKey: .country_code_iso3)
        country_capital = try values.decodeIfPresent(String.self, forKey: .country_capital)
        country_tld = try values.decodeIfPresent(String.self, forKey: .country_tld)
        continent_code = try values.decodeIfPresent(String.self, forKey: .continent_code)
        in_eu = try values.decodeIfPresent(Bool.self, forKey: .in_eu)
        postal = try values.decodeIfPresent(String.self, forKey: .postal)
        latitude = try values.decodeIfPresent(Double.self, forKey: .latitude)
        longitude = try values.decodeIfPresent(Double.self, forKey: .longitude)
        timezone = try values.decodeIfPresent(String.self, forKey: .timezone)
        utc_offset = try values.decodeIfPresent(String.self, forKey: .utc_offset)
        country_calling_code = try values.decodeIfPresent(String.self, forKey: .country_calling_code)
        currency = try values.decodeIfPresent(String.self, forKey: .currency)
        currency_name = try values.decodeIfPresent(String.self, forKey: .currency_name)
        languages = try values.decodeIfPresent(String.self, forKey: .languages)
        country_area = try values.decodeIfPresent(Double.self, forKey: .country_area)
        country_population = try values.decodeIfPresent(Int.self, forKey: .country_population)
        asn = try values.decodeIfPresent(String.self, forKey: .asn)
        org = try values.decodeIfPresent(String.self, forKey: .org)
    }

}
