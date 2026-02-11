import QtQuick
import Quickshell
import Quickshell.Services.UPower

Text {
    id: battery
    
    required property color dischargeColor
    required property color chargeColor
    required property color lowColor
    required property string fontFamily
    required property int fontSize
    
    color: {
        if (!UPower.displayDevice) return dischargeColor;
        
        const percent = UPower.displayDevice.percentage*100;
        const charging = UPower.displayDevice.state === UPowerDeviceState.Charging;
        
        if (charging) return chargeColor;
        if (percent <= 20) return lowColor;
        return dischargeColor;
    }
    
    font { family: fontFamily; pixelSize: fontSize }
    
    text: {
        if (!UPower.displayDevice) return "";
        
        const percent = Math.round(UPower.displayDevice.percentage*100);
        const charging = UPower.displayDevice.state === UPowerDeviceState.Charging;
        const icon = charging ? "󰂄" : "󰁹";
        
        return icon + " " + percent + "%";
    }


}
