<template>
  <span :class="routeActivated ? 'link link--route-activated' : 'link'">
    <NuxtLink :to="to">{{ label }}</NuxtLink>
  </span>
</template>
<script>
export default {
  props: ['to', 'label', 'routeActivated']
}
</script>
<style lang="scss">
.link {
  a {
    display: inline-block;
    color: var(--c_white);
    font-size: 1rem;
    text-decoration: none;

    position: relative;

    &::before {
      content: '';
      position: absolute;
      left: -1.4em;
      top: calc(50% - 0.5em);

      display: block;
      width: 1em;
      height: 1em;

      background-color: #CEBBC9;
      border-radius: 50%;

      transform: scale(0);
      transition: transform 0.4s var(--t_easeOut), background-color 0.6s ease-out;
    }

    &:hover {
      &::before {
        background-color: #CE2D4F;
        transform: scale(1);
      }
    }
  }

  &--route-activated {
    a.nuxt-link-exact-active {
      &::before {
        background-color: #CE2D4F;
        transform: scale(1);
      }
    }
  }
}
</style>
