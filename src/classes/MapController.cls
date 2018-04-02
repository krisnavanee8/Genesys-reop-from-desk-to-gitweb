public class MapController {

private String mapCenter;

public String setMapCenter(String center) {
    return this.mapCenter = center;
}

public String getMapCenter() {
    return this.mapCenter;
}

public PageReference setCenter() {
    return null;
}
}