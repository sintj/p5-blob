let myShaders

function preload() {
    myShaders = loadShader('shaders/vertex.glsl', 'shaders/fragment.glsl')
}

function setup() {
    createCanvas(windowWidth,windowHeight, WEBGL)
    noStroke()
}

function draw() {
    background(0);
    shader(myShaders);
    myShaders.setUniform('uTime', frameCount)
    myShaders.setUniform('uMouse', map(mouseX, 0, 1920, 0, 6))
    sphere(height/4, 200, 200)
}

function windowResized(){
    resizeCanvas(windowWidth, windowHeight);
}