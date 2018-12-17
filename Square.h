#pragma once
#include "ofxiOS.h"
class Square{
public:
    void setup(ofVec3f myPoint, int size, int random1, int random2){
        flakePoint=myPoint;
        rotationSpeed = ofRandomf();
        rotationAngle = 0;
        sizesize = size;
        x2=random1;
        y2=random2;
    }
    void update(ofVec3f myAccel){
        rotationAngle+=rotationSpeed;
        flakePoint.x-=myAccel.x*2;
        flakePoint.y+=myAccel.y*7;
        flakePoint.z-=myAccel.z*2;
        x2=x2+1;
        y2=y2+1;
        
    }
    void draw(int size2){
        ofPushMatrix();
        ofTranslate(flakePoint);
        ofRotateZDeg(rotationAngle);
        ofFill();
        ofSetColor(150+2*size2, 105-2*size2, 200+3*size2, 100);
        ofDrawTriangle(0,0,0,size2+x2,size2+y2, size2*10, 5, 5, 5);
       
        ofPopMatrix();
    }
    ofVec3f flakePoint;
    float rotationAngle, rotationSpeed;
    int sizesize;
    int x1;
    int y1;
    float x2;
    float y2;
};
