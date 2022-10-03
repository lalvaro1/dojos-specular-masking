let camera, scene, renderer;
let mesh;

const cubeUniforms = {
    iTime: { value: 0 },
    ground: { type: "t", value: new THREE.TextureLoader().load( "./textures/earth.jpg" ) }
};

function init() {

    scene = new THREE.Scene();
    camera = new THREE.PerspectiveCamera(70, window.innerWidth / window.innerHeight, 1, 1000);
    camera.position.z = 40;

    const geometry = new THREE.SphereGeometry( 15, 100, 100);

    const cubeMaterial = new THREE.ShaderMaterial({
        fragmentShader : earth_fragmentShader,
        vertexShader : earth_vertexShader,        
        uniforms : cubeUniforms,
        glslVersion: THREE.GLSL3   
    });

    mesh = new THREE.Mesh(geometry, cubeMaterial);
    scene.add(mesh);

    renderer = new THREE.WebGLRenderer();
    renderer.setSize(window.innerWidth, window.innerHeight);
    document.body.appendChild(renderer.domElement);

    window.addEventListener('resize', onWindowResize, false);
}

function onWindowResize() {
    camera.aspect = window.innerWidth / window.innerHeight;
    camera.updateProjectionMatrix();
    renderer.setSize(window.innerWidth, window.innerHeight);
}

function animate(millis) {

    let time = millis * 0.001;

    cubeUniforms.iTime.value = time;

    requestAnimationFrame(animate);

    mesh.rotation.x = 0.5;
    mesh.rotation.y = -1.5 - 0.05 * time;

    renderer.render(scene, camera);
}

init();
animate();
