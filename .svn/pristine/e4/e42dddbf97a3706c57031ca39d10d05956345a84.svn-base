/**
 * @program: traffic
 * @description: 交通公用js方法
 * @author: TengChong
 * @create: 2018-03-12 16:03
 **/
var traffic = {
    /**
     * 根据路网获取高速公路
     * @param roadNetId
     */
    getExpresswaysByRoadNet: function (roadNetId) {
        var list = null;
        tool.ajax({
            async: false,
            url: basePath + '/s/biz/traffic-expressway/net/road/' + roadNetId + '/expressways',
            success: function (data) {
                list = data.list;
            }
        });
        return list;
    },
    /**
     * 获取浏览器窗口大小
     * @returns {{width: *, height: *}}
     */
    getWindowSize: function () {
        var e = window, a = 'inner';
        if (!('innerWidth' in window)) {
            a = 'client';
            e = document.documentElement || document.body;
        }
        return {
            width: e[a + 'Width'],
            height: e[a + 'Height']
        };
    },
    /**
     * 根据原始数据计算中心坐标和缩放级别，并为地图设置中心坐标和缩放级别。
     * @param map 地图
     * @param points 点集合
     */
    setZoom: function (map, points) {
        if (points.length > 0) {
            var maxLng = points[0].lon;
            var minLng = points[0].lon;
            var maxLat = points[0].lat;
            var minLat = points[0].lat;
            var res;
            for (var i = points.length - 1; i >= 0; i--) {
                res = points[i];
                if (res.lon > maxLng) maxLng = res.lon;
                if (res.lon < minLng) minLng = res.lon;
                if (res.lat > maxLat) maxLat = res.lat;
                if (res.lat < minLat) minLat = res.lat;
            }
            var cenLng = (parseFloat(maxLng) + parseFloat(minLng)) / 2;
            var cenLat = (parseFloat(maxLat) + parseFloat(minLat)) / 2;
            var zoom = traffic.getZoom(map, maxLng, minLng, maxLat, minLat);
            map.centerAndZoom(new BMap.Point(cenLng, cenLat), zoom);
        } else {
            //没有坐标，显示全中国
            map.centerAndZoom(new BMap.Point(103.388611, 35.563611), 5);
        }
    },
    /**
     * 根据经纬极值计算绽放级别
     * @param map 地图
     * @param maxLng 最大经度
     * @param minLng 最小经度
     * @param maxLat 最大纬度
     * @param minLat 最小纬度
     * @returns {number} 缩放等级
     */
    getZoom: function (map, maxLng, minLng, maxLat, minLat) {
        var zoom = ["50", "100", "200", "500", "1000", "2000", "5000", "10000", "20000", "25000", "50000", "100000", "200000", "500000", "1000000", "2000000"]//级别18到3。
        var pointA = new BMap.Point(maxLng, maxLat);  // 创建点坐标A
        var pointB = new BMap.Point(minLng, minLat);  // 创建点坐标B
        var distance = map.getDistance(pointA, pointB).toFixed(1);  //获取两点距离,保留小数点后两位
        for (var i = 0, zoomLen = zoom.length; i < zoomLen; i++) {
            if (zoom[i] - distance > 0) {
                return 18 - i-1 ;//之所以会多3，是因为地图范围常常是比例尺距离的10倍以上。所以级别会增加3。
            }
        }
    }
}