<template>
  <div class="scroll-indicator"></div>
</template>

<script>
export default {
}
</script>

<style lang="scss">
.scroll-indicator {
  position: relative;
  height: 60px;
  width: 2px;

  overflow: hidden;

  &::after {
    content: '';
    position: absolute;
    top: 0;
    left: 0;

    width: 100%;
    height: 100%;

    background-color: var(--c_white);

    transform: translate3d(0, 100%, 0);
    animation: scroll 2s cubic-bezier(0.4, 0, 0.2, 1) 1.2s infinite;
  }
}

@keyframes scroll {
  from {
    transform: translate3d(0, 100%, 0);
  }

  to {
    transform: translate3d(0, -100%, 0);
  }
}

</style>