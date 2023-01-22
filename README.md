# Map-in-IOS!

<img src ="https://user-images.githubusercontent.com/70285394/213879832-ac165c2f-934c-4d8a-8248-a1c90e753ea9.png"  width="250" height="350"/>

```

Here's the URLComponents equivalent:

var components = URLComponents()
components.scheme = "https"
components.host = "en.wikipedia.org"
components.path = "/w/api.php"
components.queryItems = [
    URLQueryItem(name: "ggscoord", value: "\(placemark.coordinate.latitude)|\(placemark.coordinate.longitude)"),
    URLQueryItem(name: "action", value: "query"),
    URLQueryItem(name: "prop", value: "coordinates|pageimages|pageterms"),
    URLQueryItem(name: "colimit", value: "50"),
    URLQueryItem(name: "piprop", value: "thumbnail"),
    URLQueryItem(name: "pithumbsize", value: "500"),
    URLQueryItem(name: "pilimit", value: "50"),
    URLQueryItem(name: "wbptterms", value: "description"),
    URLQueryItem(name: "generator", value: "geosearch"),
    URLQueryItem(name: "ggsradius", value: "10000"),
    URLQueryItem(name: "ggslimit", value: "50"),
    URLQueryItem(name: "format", value: "json")
]
print(components.url ?? "Bad URL.")
  
```

#URL for fetching Wikipedia locations

  https://gist.github.com/twostraws/aa18008c3dd3997e133aa92bde2ad8c7


<img src ="https://user-images.githubusercontent.com/70285394/213905745-0e136471-e7ff-4d54-857a-235f89a9dc5d.png"  width="300" height="400"/>
<img src ="https://user-images.githubusercontent.com/70285394/213905758-c60213e7-72bf-4d42-b30e-38fabe18ea26.png"  width="300" height="400"/>



