const earth_vertexShader = `

varying vec3 v_normal;
varying vec2 v_UV;

void main(void) {
    gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
    v_normal = (modelViewMatrix * vec4(normal, 1.)).xyz;
    v_UV = uv;
}
`;