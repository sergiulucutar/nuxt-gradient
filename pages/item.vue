<template>
  <div class="page page_item">
    <main>
      <h1><Letters :hidden="hideTitle" :text="itemFromStore.name"/></h1>
      <ScrollIndicator />
    </main>
    <section>
      <article>
        <figure>
          <img src="/image.jpg" alt="Yellow blurred circle">
          <figcaption>Photo by <a href="https://unsplash.com/@mymind?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">mymind</a> on <a href="https://unsplash.com/?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a></figcaption>
        </figure>
        <div>
          <h3>Case Study</h3>
          <p>
            Aliquam nec nibh mi. Praesent tempor gravida efficitur. Duis pharetra blandit urna vitae sollicitudin. Nulla in quam ligula. Ut et sem congue, condimentum ante sed, semper neque. Vestibulum porttitor facilisis sapien, quis dignissim nisi dignissim nec. Suspendisse quis molestie tellus, sed elementum tellus. In hac habitasse platea dictumst. Mauris id tincidunt mauris. Morbi tincidunt libero sit amet erat euismod malesuada. 
          </p>
        </div>
      </article>
      <article>
        <figure>
          <img src="/image.jpg" alt="Yellow blurred circle">
          <figcaption>Photo by <a href="https://unsplash.com/@mymind?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">mymind</a> on <a href="https://unsplash.com/?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a></figcaption>
        </figure>
        <div>
          <h3>Case Study</h3>
          <p>
            Sed arcu tortor, fringilla at diam at, consequat dignissim enim. Vivamus in tortor cursus, pulvinar nisl placerat, gravida tellus. Curabitur convallis sapien vel volutpat facilisis. Integer commodo, nisi sit amet congue tempor, velit enim varius ex, et tempor urna nunc quis nibh. Sed molestie augue sed mi lacinia lobortis. Suspendisse eu aliquam metus. Etiam et rhoncus dui. Proin vel interdum diam. Morbi volutpat dignissim felis, non facilisis magna tempus sagittis.
          </p>
        </div>
      </article>
      <article>
        <figure>
          <img src="/image.jpg" alt="Yellow blurred circle">
          <figcaption>Photo by <a href="https://unsplash.com/@mymind?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">mymind</a> on <a href="https://unsplash.com/?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a></figcaption>
        </figure>
        <div>
          <h3>Case Study</h3>
          <p>
            Pellentesque dignissim hendrerit nibh, sit amet pulvinar lectus scelerisque ut. Etiam scelerisque euismod neque ut semper. Duis at leo arcu. Fusce congue metus nec mi auctor, sit amet dapibus metus ullamcorper. Fusce et turpis vel ante tempor laoreet at a ligula. Suspendisse vehicula sem nec tortor aliquam, ac eleifend nisl tristique. Vivamus at ultricies tellus. Morbi ultricies tempus lorem eget iaculis.
          </p>
        </div>
      </article>
      <article>
        <figure>
          <img src="/image.jpg" alt="Yellow blurred circle">
          <figcaption>Photo by <a href="https://unsplash.com/@mymind?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">mymind</a> on <a href="https://unsplash.com/?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText">Unsplash</a></figcaption>
        </figure>
        <div>
          <h3>Case Study</h3>
          <p>
            Donec imperdiet erat dignissim porttitor scelerisque. Mauris vel porta risus. Praesent enim dolor, viverra ac erat a, sollicitudin convallis leo. Sed elementum suscipit sem, nec tempor nunc aliquet et. Sed nunc purus, blandit lobortis consectetur quis, interdum eget orci. Quisque sagittis tellus ultricies elit viverra faucibus. Vestibulum ornare euismod quam, a vulputate enim eleifend sit amet. Duis nec justo feugiat, commodo ipsum et, pulvinar massa.
          </p>
        </div>
      </article>
    </section>
  </div>
</template>
<script>
export default {
  data: function() {
    return {
      hideTitle: true
    }
  },
  computed: {
    itemFromStore() {
      return this.$store.state.items[this.$route.params.id];
    }
  },
  transition: {
    name: 'item',
    mode: 'out-in'
  },
  mounted: function() {
    this.toggleTitle();
  },
  methods: {
    toggleTitle() {
      this.hideTitle = !this.hideTitle;
    }
  },
  // beforeRouteEnter(to, from, next) {
  //   console.log(this);
  //   next(vm => {
  //      vm.$nuxt.$emit('bgItemView', true);
  //   });
  // },
  beforeRouteLeave(to, from, next) {
    this.$nuxt.$emit('bgItemView', false);
    next();
  }
}
</script>
<style lang="scss">
  @import '../layouts/style/resolutions.scss';

  .page_item {
    width: 100%;
  
    main {
      display: flex;
      justify-content: center;
      align-items: center;
      width: 100%;
      height: 100vh;

      h1 {
        padding: 0 4rem;

        margin: 0;
      }

      .scroll-indicator {
        position: absolute;
        bottom: 6rem;
      }
    }

    article {
      position: relative;
      padding: 10% 2vw;

      &::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 1px;

        background-color: var(--c_white);
        opacity: 0.2;
      }
      
      div {
        grid-column: 3;
      }

      figure {
        grid-column: 2;
        width: 100%;
        height: auto;

        overflow: hidden;
        text-align: center;

        figcaption {
          text-align: right;
        }
      }

      img {
        width: 100%;
        height: auto;
      }
    }

    @media only screen and (max-width: $r_medium) {
      h1 {
        font-size: 2.6em;
      }
    }

    @media only screen and (min-width: $r_medium) {

      article {
        display: grid;
        grid-template-columns: 1fr 3fr 6fr 2fr;
        grid-gap: 2vw;

        height: 50vh;
        padding: 0;

        figure {
          grid-column: 2;
          height: 100%;
          padding: 10% 0;

          figcaption {
            text-align: center;
          }
        }

        img {
          width: auto;
          height: 90%;
        }
      }
    }
  }

.item-enter-active, .home-leave-active { transition: opacity .5s; }
.item-enter, .home-leave-to { opacity: 0; }
</style>