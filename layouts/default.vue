<template>
  <div>
    <transition name="background" appear>
      <Background />
    </transition>
    <template v-if="!isContentHidden">
      <Nuxt />
      <transition name="menu" appear>
        <Menu />
      </transition>
    </template>
  </div>
</template>

<script>
export default {
  data() {
    return {
      isContentHidden: true
    };
  },
  created() {
    this.$nuxt.$on("introFinished", () => (this.isContentHidden = false));
  }
};
</script>

<style lang="scss">
:root {
  --c_white: #f6f4f5; //#69585F;
  --c_black: #231f20;

  --t_easeOut: cubic-bezier(0.33, 1, 0.68, 1);
}

html {
  font-size: 16px;
  word-spacing: 1px;
  -ms-text-size-adjust: 100%;
  -webkit-text-size-adjust: 100%;
  -moz-osx-font-smoothing: grayscale;
  -webkit-font-smoothing: antialiased;
  box-sizing: border-box;
}

*,
*::before,
*::after {
  box-sizing: border-box;
  margin: 0;
}

body {
  margin: 0;
}

a {
  color: var(--c_white);
  text-decoration: none;

  pointer-events: all;
}

.menu-enter-active {
  transition: opacity 0.6s ease-out 0.6s;
}
.menu-enter {
  opacity: 0;
}

.background-enter-active {
  transition: filter 1s ease-out 0.5s;
}
.background-enter {
  filter: grayscale(100%);
}
</style>
