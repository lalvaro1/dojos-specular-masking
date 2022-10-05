const earth_fragmentShader = `

out vec4 fragColor;
varying vec3 v_normal;
varying vec2 v_UV;
varying vec3 v_position;

uniform float time;
uniform sampler2D ground;


void mainImage( out vec4 fragColor, in vec2 fragCoord ) {

    vec3 light = normalize(vec3(1, -0.2, -0.5));
    float ambient = 0.1;
    float diffuse = dot(-light, v_normal);

    fragColor.xyz = texture(ground, v_UV).rgb * (ambient + diffuse);
    fragColor.a = 1.0;

    vec3 refl = reflect(normalize(v_position - cameraPosition), v_normal);
   
    float hilight = pow(clamp(dot(refl, v_normal), 0., 1.), 10.);

}

void main() {
    mainImage(fragColor, gl_FragCoord.xy);
}
`;