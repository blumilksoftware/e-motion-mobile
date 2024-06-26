class CitiesWithProvidersModel {
  List<Cities>? cities;
  List<Providers>? providers;
  List<Countries>? countries;

  CitiesWithProvidersModel({this.cities, this.providers, this.countries});

  CitiesWithProvidersModel.fromJson(Map<String, dynamic> json) {
    if (json['cities'] != null) {
      cities = <Cities>[];
      json['cities'].forEach((v) {
        cities!.add(Cities.fromJson(v));
      });
    }
    if (json['providers'] != null) {
      providers = <Providers>[];
      json['providers'].forEach((v) {
        providers!.add(Providers.fromJson(v));
      });
    }
    if (json['countries'] != null) {
      countries = <Countries>[];
      json['countries'].forEach((v) {
        countries!.add(Countries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cities != null) {
      data['cities'] = cities!.map((v) => v.toJson()).toList();
    }
    if (providers != null) {
      data['providers'] = providers!.map((v) => v.toJson()).toList();
    }
    if (countries != null) {
      data['countries'] = countries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cities {
  int? id;
  String? name;
  String? slug;
  String? latitude;
  String? longitude;
  List<CityAlternativeNames>? cityAlternativeNames;
  List<CityProviders>? cityProviders;
  Country? country;
  List<CityOpinions>? cityOpinions;

  Cities({
    this.id,
    this.name,
    this.slug,
    this.latitude,
    this.longitude,
    this.cityAlternativeNames,
    this.cityProviders,
    this.country,
    this.cityOpinions,
  });

  Cities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    if (json['city_alternative_names'] != null) {
      cityAlternativeNames = <CityAlternativeNames>[];
      json['city_alternative_names'].forEach((v) {
        cityAlternativeNames!.add(CityAlternativeNames.fromJson(v));
      });
    }
    if (json['cityProviders'] != null) {
      cityProviders = <CityProviders>[];
      json['cityProviders'].forEach((v) {
        cityProviders!.add(CityProviders.fromJson(v));
      });
    }
    country =
        json['country'] != null ? Country.fromJson(json['country']) : null;
    if (json['cityOpinions'] != null) {
      cityOpinions = <CityOpinions>[];
      json['cityOpinions'].forEach((v) {
        cityOpinions!.add(CityOpinions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    if (cityAlternativeNames != null) {
      data['city_alternative_names'] =
          cityAlternativeNames!.map((v) => v.toJson()).toList();
    }
    if (cityProviders != null) {
      data['cityProviders'] = cityProviders!.map((v) => v.toJson()).toList();
    }
    if (country != null) {
      data['country'] = country!.toJson();
    }
    if (cityOpinions != null) {
      data['cityOpinions'] = cityOpinions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CityAlternativeNames {
  int? id;
  String? name;
  int? cityId;
  String? createdAt;
  String? updatedAt;

  CityAlternativeNames({
    this.id,
    this.name,
    this.cityId,
    this.createdAt,
    this.updatedAt,
  });

  CityAlternativeNames.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    cityId = json['city_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['city_id'] = cityId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class CityProviders {
  int? id;
  String? providerName;
  int? cityId;
  String? createdBy;
  String? createdAt;
  String? updatedAt;

  CityProviders({
    this.id,
    this.providerName,
    this.cityId,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
  });

  CityProviders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    providerName = json['provider_name'];
    cityId = json['city_id'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['provider_name'] = providerName;
    data['city_id'] = cityId;
    data['created_by'] = createdBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Country {
  int? id;
  String? name;
  String? slug;
  String? alternativeName;
  String? latitude;
  String? longitude;
  String? iso;
  String? createdAt;
  String? updatedAt;

  Country({
    this.id,
    this.name,
    this.slug,
    this.alternativeName,
    this.latitude,
    this.longitude,
    this.iso,
    this.createdAt,
    this.updatedAt,
  });

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    alternativeName = json['alternative_name'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    iso = json['iso'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['alternative_name'] = alternativeName;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['iso'] = iso;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class CityOpinions {
  int? id;
  String? content;
  int? rating;
  int? cityId;
  int? userId;
  String? createdAt;
  String? updatedAt;

  CityOpinions({
    this.id,
    this.content,
    this.rating,
    this.cityId,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  CityOpinions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    rating = json['rating'];
    cityId = json['city_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['content'] = content;
    data['rating'] = rating;
    data['city_id'] = cityId;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Providers {
  String? name;
  String? url;
  String? androidUrl;
  String? iosUrl;
  String? color;

  Providers({this.name, this.url, this.androidUrl, this.iosUrl, this.color});

  Providers.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
    androidUrl = json['android_url'];
    iosUrl = json['ios_url'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    data['android_url'] = androidUrl;
    data['ios_url'] = iosUrl;
    data['color'] = color;
    return data;
  }
}

class Countries {
  int? id;
  String? name;
  String? slug;
  String? alternativeName;
  String? latitude;
  String? longitude;
  String? iso;

  Countries({
    this.id,
    this.name,
    this.slug,
    this.alternativeName,
    this.latitude,
    this.longitude,
    this.iso,
  });

  Countries.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    alternativeName = json['alternative_name'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    iso = json['iso'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['alternative_name'] = alternativeName;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['iso'] = iso;
    return data;
  }
}
