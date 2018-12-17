#include "ofApp.h"
void ofApp::setup(){
    ofBackground(0, 0, 0);
    ofSetCircleResolution(100);
    coreMotion.setupAccelerometer();
    size = 1;
    shape = 1;
    
}
//--------------------------------------------------------------
void ofApp::update(){
    coreMotion.update();
    ofVec3f accel = coreMotion.getAccelerometerData();
    erase();
    
    if(shape == 1){
        for(int i=0;i<myFlakes.size();i++){
            myFlakes[i].update(accel);
        }
        } else if (shape == 2) {
        for(int i=0;i<mySquares.size();i++){
            mySquares[i].update(accel);
        }
        
    }
}
//--------------------------------------------------------------
void ofApp::draw(){
    
    if(shape == 1){
        for(int i=0;i<myFlakes.size();i++){
            myFlakes[i].draw(size, pos);
        }} else if (shape == 2) {
            for(int i=0;i<mySquares.size();i++){
                mySquares[i].draw(size);
            }}
    
}
//--------------------------------------------------------------
void ofApp::exit(){}

//--------------------------------------------------------------
void ofApp::touchDown(ofTouchEventArgs & touch){
    
    
}

//--------------------------------------------------------------
void ofApp::touchMoved(ofTouchEventArgs & touch){
    
    pos.x = touch.x;
    pos.y = touch.y;
    pos.z = 0;
    
    if(touch.id == 0){
        newobject(touch.x, touch.y);
    }
    
    
    
    xDirection2=touch.x;
    yDirection2=touch.y;
    
    
    size=myRadius/15;
    
    
    cout << size << endl;
    
    //cout << touch.id << endl;
    
    if(touch.id==0){
        touchPoint.set(touch);
    }
    if(touch.id==1){
        myRadius=touchPoint.distance(touch);
    }
    
}

//--------------------------------------------------------------
void ofApp::touchUp(ofTouchEventArgs & touch){
    
    
}

//--------------------------------------------------------------
void ofApp::touchDoubleTap(ofTouchEventArgs & touch){
    
    void modechange();
    
    if(touch.id == 0) {
        if(shape == 1){
            shape = 2;
        }
        else if (shape == 2) {
            shape = 1;
        }
    }
    
    
}

//--------------------------------------------------------------
void ofApp::touchCancelled(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void ofApp::lostFocus(){
    
}

//--------------------------------------------------------------
void ofApp::gotFocus(){
    
}

//--------------------------------------------------------------
void ofApp::gotMemoryWarning(){
    
}

//--------------------------------------------------------------
void ofApp::deviceOrientationChanged(int newOrientation){
    
}


//OMAT FUNKTIOT-------------------------------------------------
//--------------------------------------------------------------
void ofApp::newobject(float x, float y){
    
    
    
    if(shape == 1){
        for(int i = 1; i<10; i++) {
            int random1 = ofRandom(-5, 5);
            int random2 = ofRandom(-5, 5);
            int random3 = ofRandom(-2, 2);
            Flake newFlake;
            newFlake.setup(pos, size, random1, random2, random3);
            myFlakes.push_back(newFlake);
            xDirection1=x;
            yDirection1=y;}
    } else if (shape == 2){
        for(int i = 1; i<10; i++) {
            Square newSquare;
            ofSetColor(255, 255, 255, 100);
            int random1 = ofRandom(-5, 5);
            int random2 = ofRandom(-5, 5);
            newSquare.setup(pos, size, random1, random2);
            mySquares.push_back(newSquare);
            xDirection1=x;
            yDirection1=y;
        }}
    
}




//--------------------------------------------------------------
void ofApp::erase(){
    if(mySquares.size()>7){
        for(int y=1; y<7; y++){
            mySquares.erase(mySquares.begin());
        }}
    
    
    if(myFlakes.size()>5){
        for(int y=1; y<5; y++){
            myFlakes.erase(myFlakes.begin());
        }}

}


