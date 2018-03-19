/* Copyright 2016 Aditya Mehra <aix.m@outlook.com>                            

    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Lesser General Public
    License as published by the Free Software Foundation; either
    version 2.1 of the License, or (at your option) version 3, or any
    later version accepted by the membership of KDE e.V. (or its
    successor approved by the membership of KDE e.V.), which shall
    act as a proxy defined in Section 6 of version 3 of the license.
    
    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Lesser General Public License for more details.
    
    You should have received a copy of the GNU Lesser General Public
    License along with this library.  If not, see <http://www.gnu.org/licenses/>.
*/

import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.components 2.0 as PlasmaComponents

Item {
        id: dashDelegateItm
        height: units.gridUnit * 4
        width: cbwidth

        Item {
            id: contentdlgtitem
            width: parent.width
            height: parent.height
            
          Item {
            id: skillTopRowLayout
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            implicitHeight: dashHeader.implicitHeight + units.gridUnit * 0.5
            
            Text {
                id: dashHeader
                anchors.left: dashHeaderSeprtr.right
                anchors.leftMargin: units.gridUnit * 0.25
                anchors.verticalCenter: parent.verticalCenter
                wrapMode: Text.Wrap;
                font.bold: true;
                text: i18n(itemWeatherCity + " | " + itemWeatherTempType)
                color: theme.textColor
            }
            
            Image {
                id: weatherDashCardIcon
                anchors.left: dashHeader.right
                anchors.leftMargin: units.gridUnit * 0.25
                anchors.verticalCenter: parent.verticalCenter
                source: itemWeatherIconType
                width: units.gridUnit * 1.25
                height: units.gridUnit * 1.25
            }
            
            Text {
                id: weatherDashCardWind
                anchors.right: parent.right
                anchors.rightMargin: units.gridUnit * 1
                anchors.verticalCenter: parent.verticalCenter
                font.bold: true;
                text: i18n("Wind | " + itemWeatherWind + " meters/sec")
                color: theme.textColor
            }
            
            PlasmaCore.SvgItem {
                id: dashHeaderSeprtr
                anchors {
                    left: contxtnewsitemmenu.right
                    leftMargin: units.gridUnit * 0.25
                    verticalCenter: parent.verticalCenter
                }
                height: units.gridUnit * 1
                width: linetopleftvertSvg.elementSize("vertical-line").width
                z: 110
                elementId: "vertical-line"

                svg: PlasmaCore.Svg {
                    id: dashhdrvertSvg;
                    imagePath: "widgets/line"
                }
            }

            ToolButton {
                id: contxtnewsitemmenu
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                width: units.gridUnit * 1
                height: units.gridUnit * 1
                Image {
                    id: innrnewitemcontxmenuimage
                    source: "../images/ctxmenu.png"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: units.gridUnit * 0.60
                    height: units.gridUnit * 0.50
                }
                ColorOverlay {
                    anchors.fill: innrnewitemcontxmenuimage
                    source: innrnewitemcontxmenuimage
                    color: theme.textColor
                }
                onClicked: {
                    mcmenuItem.open()
                    }
                }
            }
            
            Rectangle {
                id: nwsseprator
                width: parent.width
                anchors.top: skillTopRowLayout.bottom
                anchors.topMargin: 1
                height: 2
                color: theme.linkColor
            }
            
            Text {
                id: weatherDshTempMinLabel
                anchors.top: nwsseprator.bottom
                anchors.topMargin: 1
                anchors.left: parent.left
                color: theme.textColor
                wrapMode: Text.WordWrap;
                font.bold: true;
                text: "Minimum Temperature: " + itemWeatherTempMin + itemWeatherMetricType
                }
                
            Rectangle {
                id: nwsseprator2
                width: parent.width
                anchors.top: weatherDshTempMinLabel.bottom
                anchors.topMargin: 1
                height: 2
                color: theme.linkColor
            }

            Text {
                id: weatherDshTempCurrentLabel
                anchors.top: nwsseprator2.bottom
                anchors.topMargin: 1
                anchors.left: parent.left
                wrapMode: Text.WordWrap;
                font.bold: true;
                text: "Current Temperature: " + itemWeatherTemp + itemWeatherMetricType
                color: theme.textColor
            }
            
            Rectangle {
                id: nwsseprator3
                width: parent.width
                anchors.top: weatherDshTempCurrentLabel.bottom
                anchors.topMargin: 1
                height: 2
                color: theme.linkColor
            }

            Text {
                id: weatherDshTempMaxLabel
                anchors.top: nwsseprator3.bottom
                anchors.topMargin: 1
                anchors.left: parent.left
                wrapMode: Text.WordWrap;
                font.bold: true;
                color: theme.textColor
                text:"Maximum Temperature: " + itemWeatherTempMax + itemWeatherMetricType
                }
            }
            
        Drawer {
                id: mcmenuItem
                width: dwrpaddedwidth
                height: removeCardRectbtn.height + disableCardRectbtn.height 
                y: getY
                z: 30
                dragMargin: 0

                Rectangle {
                    id: menuRectItem
                    anchors.fill: parent
                    color: theme.backgroundColor
            
                    Column {
                        id: menuRectColumn
                        anchors.fill: parent
                        
                        Rectangle {
                            id: removeCardRectbtn
                            width: parent.width
                            height: units.gridUnit * 2
                            color: theme.backgroundColor
                            
                            Row {
                               spacing: 5
                                PlasmaCore.IconItem {
                                   id: removeCardIcon
                                   anchors.verticalCenter: parent.verticalCenter
                                   source: "archive-remove"
                                   width: units.gridUnit * 2
                                   height: units.gridUnit * 2
                               }
                               Rectangle {
                                   id: removeCardSeperater
                                   width: 1
                                   height: parent.height
                                   color: theme.linkColor
                               }
                               PlasmaComponents.Label {
                                   id: removeCardLabel
                                   anchors.verticalCenter: parent.verticalCenter
                                   text: "Remove Card"
                                }
                            }
                            MouseArea {
                                anchors.fill: parent
                                hoverEnabled: true
                                    onEntered: {
                                        removeCardLabel.color = theme.linkColor
                                    }
                                    onExited:{
                                        removeCardLabel.color = theme.textColor
                                    }
                                    onClicked:{
                                        dashweatherListModel.remove(index)
                                        removeChildCard()
                                    }
                                }
                            }
                            
                        Rectangle {
                            id: btnshorzSepr
                            width: parent.width
                            height: 1
                            color: theme.linkColor
                        }
                            
                        Rectangle {
                            id: disableCardRectbtn
                            width: parent.width
                            height: units.gridUnit * 2
                            color: theme.backgroundColor
                            
                            Row {
                               spacing: 5
                                PlasmaCore.IconItem {
                                   id: disableCardIcon
                                   anchors.verticalCenter: parent.verticalCenter
                                   source: "document-close"
                                   width: units.gridUnit * 2
                                   height: units.gridUnit * 2
                               }
                               Rectangle {
                                   id: disableCardSeperater
                                   width: 1
                                   height: parent.height
                                   color: theme.linkColor
                               }
                               PlasmaComponents.Label {
                                   id: disableCardLabel
                                   anchors.verticalCenter: parent.verticalCenter
                                   text: "Disable Weather Cards"
                                }
                            }
                            MouseArea {
                                anchors.fill: parent
                                hoverEnabled: true
                                    onEntered: {
                                        disableCardLabel.color = theme.linkColor
                                    }
                                    onExited:{
                                        disableCardLabel.color = theme.textColor
                                    }
                                    onClicked:{
                                        weathercardswitch.checked = false
                                        dashweatherListModel.remove(index)
                                        removeChildCard()
                                        }
                                    }
                                }
                                
                        Rectangle {
                            id: btnshorzSeprEnd
                            width: parent.width
                            height: units.gridUnit * 0.75
                            color: theme.linkColor
                            
                            PlasmaCore.IconItem {
                                   id: closemenuDrawer
                                   anchors.centerIn: parent
                                   source: "go-up"
                                   width: units.gridUnit * 2
                                   height: units.gridUnit * 2
                                    }
                                }
                            }
                        }
                    }
                }
