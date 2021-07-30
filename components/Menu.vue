<template>
  <nav :class="toggleMenu ? 'menu--opened' : ''">
    <div>
      <CustomLink to="/" label="LOGO" />
    </div>
    <ul>
      <li><CustomLink to="/" label="PROJECTS" routeActivated="true" /></li>
      <li><CustomLink to="/about" label="ABOUT" routeActivated /></li>
      <li><CustomLink to="/contact" label="CONTACT" routeActivated /></li>
    </ul>
    <ul>
      <li><CustomLink to="/twitter" label="TW" /></li>
      <li><CustomLink to="/facebook" label="FB" /></li>
    </ul>
    <button @click="toggleMenu = !toggleMenu"><span></span></button>
  </nav>
</template>

<script>
export default {
  data() {
    return {
      toggleMenu: false
    }
  },
  watch: {
    $route() {
      this.toggleMenu = false;
    }
  }
}
</script>

<style lang="scss">
@import '../layouts/style/resolutions.scss';

nav {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;

  display: flex;
  flex-direction: column;
  justify-content: space-between;

  padding: 4rem 3rem;

  pointer-events: none;

  &::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;

    width: 100%;
    height: 100%;

    background-color: #CEBBC9;

    opacity: 0;
    transition: opacity 0.6s cubic-bezier(0.22, 1, 0.36, 1);
    z-index: -1;
  }

  button {
    position: fixed;
    top: 0;
    right: 0;

    display: block;
    width: 60px;
    height: 60px;

    border: none;
    margin: 4rem 3rem;

    background-color: transparent;

    transform: translateY(calc(-50% + 0.5rem));
    transition: transform .6s cubic-bezier(0.22, 1, 0.36, 1);

    overflow: hidden;
    pointer-events: all;

    span {
      position: relative;
      display: block;
      width: 100%;
      height: 100%;

      &::after, &::before {
        content: '';
        position: absolute;
        top: 50%;
        left: 0;

        display: block;

        width: 100%;
        height: 1px;

        background-color: var(--c_white);

        transition: transform .6s cubic-bezier(0.22, 1, 0.36, 1);
      }

      &::after {
        transform: translateY(-5px);
      }

      &::before {
        transform: translateY(5px);
      }
    }
  }

  ul {
    padding: 0;
    margin: 0;
    list-style: none;

    opacity: 0;
    transition: opacity .6s cubic-bezier(0.22, 1, 0.36, 1);

    &:nth-of-type(1) {
      // display: none;
    }

    &:nth-of-type(2) {
      display: flex;
      justify-content: center;
      align-items: flex-end;

      li:not(:first-child) {
        margin-left: 2rem;
      }
    }
  }

  &.menu--opened {
    &::before {
      opacity: 1;
    }

    button {
      transform: translateY(calc(-50% + 0.5rem)) rotate(270deg);

      span {
        &::after {
          transform: translateY(0) rotate(45deg);
        }

        &::before {
          transform: translateY(0) rotate(-45deg);
        }
      }
    }

    ul {
      opacity: 1;
    }
  }

  @media only screen and (min-width: $r_medium) {
    display: grid;
    grid-template-columns: 1fr 1fr;
    grid-template-rows: 1fr 1fr;
    align-items: flex-start;
    justify-content: flex-start;

    padding: 6rem;

    pointer-events: none;

    &::before {
      opacity: 0;
    }

    button {
      display: none;
    }

    ul {
      opacity: 1;

      &:nth-of-type(1) {
        display: flex;
        justify-content: flex-end;
      }

      &:nth-of-type(2) {
        grid-column: 2;
        grid-row: 2;

        justify-content: flex-end;
        align-self: flex-end;
        justify-self: flex-end;
      }

      li:not(:first-child) {
        margin-left: 2rem;
      }
    }
  }
}

</style>