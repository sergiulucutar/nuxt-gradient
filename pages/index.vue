<template>
  <div class="page page-index container">
    <main>
    <ul
        @mouseover="isListHovered = true"
        @mouseleave="isListHovered = false"
      >
        <li v-for="(item, index) of itemsFromStore" :key=index
          :class="itemSelected === index ? 'active' : ''"
          @click="selectItem(index)"
          @mouseover="itemHovered = index"
          >
            <a><Letters :hidden="itemSelected===index || itemsHidden" :text=item.name /></a>  
        </li>
      </ul>
  </main>
  </div>
</template>

<script>
export default {
  transition: {
    name: 'home',
    mode: 'out-in'
  },
  data: function() {
    return {
      isListHovered: false,
      itemHovered: 0,
      itemSelected: null,
      itemsHidden: true
    }
  },
  watch: {
    // itemHovered: function(val) {
    //   this.$nuxt.$emit('bgRotate', val / 20);
    // },
    // isListHovered: function(val) {
    //   if(!val) {
    //     this.$nuxt.$emit('bgRotate', 0);
    //   }
    // }
  },
  computed: {
    itemsFromStore() {
      return this.$store.state.items;
    }
  },
  mounted() {
    setTimeout(() => this.itemsHidden = false, 0);
  },
  beforeRouteLeave(to, from, next) {
    this.$nuxt.$emit('bgItemView');
    next();
  },
  methods: {
    selectItem(id) {
      this.itemSelected = id;
      this.$router.push({
        path: `/items/${id}`
      });
    }
  }
}
</script>

<style lang="scss">
@import '../layouts/style/resolutions.scss';

.page-index {

  main {
    grid-column: 3 / -1;

    display: flex;
    flex-direction: column;
    justify-content: flex-start;
    align-items: flex-start;

    font-size: 0.5rem;

    padding: 8rem 0;
    padding-left: 3rem;

    ul {
      display: flex;
      flex-direction: column;
      align-items: flex-start;

      padding: 0;
      margin: 0;

      list-style: none;
      line-height: 1.2;

      &:hover a {
        opacity: 0.4;
      }

      li {
        position: relative;
        overflow: hidden;

        &::before {
          content: '';
          position: absolute;
          right: 1.5em;
          top: 0;

          display: block;
          width: 5em;
          height: 5em;

          background-color: #CEBBC9;
          border-radius: 50%;

          transform-origin: bottom left;
          transform: scale(0);
          transition: transform 0.4s var(--t_easeOut), background-color 0.6s ease-out;
        }

        &::after {
          content: '↗';
          position: absolute;
          right: .5em;
          top: 0;

          display: block;

          font-size: 5em;
          line-height: 1;

          transform-origin: bottom left;
          transform: scale(0);
          transition: transform 0.3s ease-out;
        }

        &:not(.active):hover {
          &::before {
            background-color: #CE2D4F;
            transform: scale(1);
          }

          &::after {
            transform: scale(1);
          }
          
          a {
            opacity: 1;
          }
        }

        a {
          display: block;

          color: var(--c_white);
          font-family: 'Agatho Light', sans-serif;
          font-size: 5em;
          line-height: 1;
          text-decoration: none;
          text-transform: uppercase;

          cursor: pointer;
          transition: opacity 0.4s var(--t_easeOut);
        }
      }
    }
  }

  @media only screen and (min-width: $r_medium) {
    display: grid;
    grid-template-columns: repeat(12, 1fr);

    main {
      padding: 8rem 0;

      font-size: 1rem;

      a {
        margin-right: 1.5em;
      }
    }
  }
}

// .home-enter {
//   main ul li a {
//     // transform: translateY(100%);
//   }
// }

.item-leave-to {
  main ul li {
    a {
      opacity: 0 !important;
    }

    &.active a {
      opacity: 1 !important;
    }
  }
}

.home-enter-active, .item-leave-active {
  transition-duration: .6s;

  main ul li a {
    transition: opacity .4s ease-out;
  }
}
</style>
