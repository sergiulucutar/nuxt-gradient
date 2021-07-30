<template>
  <div class="letters__container" ref="container">
    <span class="letters__char">
      <span v-for="(letterIndex, index) in text" :key="index"><pre>{{ letterIndex }}</pre></span>
    </span>
  </div>
</template>

<script>
import gsap from 'gsap';

export default {
  data() {
    return {
      lettersEls: null
    }
  },
  props: {
    hidden: {
      type: Boolean,
      default: false
    },
    text: {
      type: String,
      required: true
    }
  },
  watch: {
    hidden: function(val) {
      if(val) {
        gsap.to(this.els, {
          yPercent: -100,
          z: 0.1,
          rotationZ: 0.01,
          duration: 1,
          stagger: {
            amount: 0.2
          },
          ease: 'expo'
        });
      } else {
        gsap.set(this.els, { yPercent: 100 })
        gsap.to(this.els, {
          yPercent: 0,
          z: 0.1,
          rotationZ: 0.01,
          duration: 1,
          stagger: {
            amount: 0.2
          },
          ease: 'expo'
        });
      }
    }
  },
  mounted() {
    this.els = this.$refs.container.querySelectorAll('.letters__char span');
    if(this.hidden) {
      gsap.set(this.els, { yPercent: 100 });
    }
  }
}
</script>

<style lang="scss">
.letters {
  &__char {
    display: inline-block;
    overflow: hidden;

    span {
      display: inline-block;

      pre {
        font-family: inherit; 
        font-size: inherit;
        line-height: inherit;
      }
    }
  }
}
</style>