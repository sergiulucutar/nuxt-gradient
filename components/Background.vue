<template>
  <div ref="background" class="background"></div>
</template>
<script>
import gsap from "gsap";

import * as PIXI from "pixi.js";
import fragmentShader from "../shaders/background/fragment.glsl";
import vertexShader from "../shaders/background/vertex.glsl";

import { ColorConvertor } from "../services/color-convertor.service.js";

export default {
  data: function() {
    return {
      pixiApp: null,
      pixiAppMesh: null,
      sizes: {
        width: window.innerWidth,
        height: window.innerHeight
      },
      acceleration: 1,
      shine: 0
    };
  },
  created() {
    this.createBackground();
  },
  mounted: function() {
    this.$refs["background"].appendChild(this.pixiApp.renderer.view);
    const timeline = gsap.timeline({
      onComplete: () => {
        this.registerLoop();
      }
    });

    timeline
      .to(this.pixiAppMesh.shader.uniforms, {
        uTime: 0,
        duration: 3,
        ease: "expo"
      })
      .from(
        this.pixiAppMesh.shader.uniforms,
        {
          uIntroTime: 1.2,
          duration: 2
        },
        0
      )
      .add(() => this.$nuxt.$emit("introFinished"), 2);

    // this.$nuxt.$on('bgRotate', angle => this.rotate(angle));
    // this.$nuxt.$on('bgUpdate', ({ isListHovered }) => this.toggleFocus(isListHovered));
    this.$nuxt.$on("bgItemView", toggleItemView =>
      this.toggleItemView(toggleItemView)
    );
  },
  methods: {
    createBackground() {
      const { sizes } = this;
      const shaderParameters = {
        primaryColor: "#CE2D4F",
        secondaryColor: "#CEBBC9",
        backgroundColor: "#74A4BC",
        backgroundLightColor: "#ACC9D7"
      };

      const app = new PIXI.Application({
        resizeTo: window,
        antialias: true
      });

      const geometry = new PIXI.Geometry()
        .addAttribute(
          "aVertexPosition",
          [0, 0, sizes.width, 0, sizes.width, sizes.height, 0, sizes.height],
          2
        )
        .addAttribute("aUvs", [0, 0, 1, 0, 1, 1, 0, 1], 2)
        .addIndex([0, 1, 2, 0, 2, 3]);

      const uniforms = {
        uResolition: sizes.width / sizes.height,
        uTime: -1,
        uIntroTime: 0,
        uPrimaryColor: ColorConvertor.hexToShaderRgb(
          shaderParameters.primaryColor
        ),
        uSecondaryColor: ColorConvertor.hexToShaderRgb(
          shaderParameters.secondaryColor
        ),
        uBackgroundColor: ColorConvertor.hexToShaderRgb(
          shaderParameters.backgroundColor
        ),
        uBackgroundLightColor: ColorConvertor.hexToShaderRgb(
          shaderParameters.backgroundLightColor
        )
      };

      const shader = new PIXI.Shader.from(
        vertexShader,
        fragmentShader,
        uniforms
      );
      const mesh = new PIXI.Mesh(geometry, shader);
      app.stage.addChild(mesh);

      this.pixiApp = app;
      this.pixiAppMesh = mesh;

      window.onresize = () => {
        sizes.width = window.innerWidth;
        sizes.height = window.innerHeight;

        shader.uniforms.uResolition = sizes.width / sizes.height;
      };
    },
    toggleItemView() {
      const tl = gsap.timeline();
      tl.to(this, {
        acceleration: 5,
        duration: 1
      }).to(this, {
        acceleration: 1,
        duration: 1
      });
    },
    registerLoop() {
      setInterval(() => {
        const tl = gsap.timeline();
        tl.to(this, {
          shine: 0.2,
          duration: 1.5
        }).to(this, {
          shine: 0,
          duration: 4
        });
      }, 10000);

      this.pixiApp.ticker.add((a, b, c) => {
        this.pixiAppMesh.shader.uniforms.uTime += 0.001 * this.acceleration;
        this.pixiAppMesh.shader.uniforms.uIntroTime = this.shine;
      });
    }
  }
};
</script>
<style lang="scss">
.background {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;

  z-index: -1;

  canvas {
    width: 100%;
    height: 100%;
  }
}
</style>
