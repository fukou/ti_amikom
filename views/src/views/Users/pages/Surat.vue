<template>
  <div class="pa-3">
    <v-container class="pa-5">
      <h1 class="mb-5">Daftar surat</h1>
      <div
        class="pengumuman__list"
        v-infinite-scroll="getData"
        infinite-scroll-disabled="busy"
        infinite-scroll-distance="limit"
      >
        <div v-if="items.length == 0">
          <h2 class="title purple--text">Belum ada surat yang dikirim</h2>
        </div>

        <div
          v-for="(item, index) in items"
          :key="index"
          data-aos="fade-up"
          data-aos-offset="100"
          data-aos-easing="ease-in-out"
        >
          <v-card class="pa-5">
            <v-card-title class="mb-4">
              <h2 class="headline font-weight-bold">{{ item.judul_surat }}</h2>
            </v-card-title>
            <v-card-text>
              <p class="mb-2">
                <v-icon left>date_range</v-icon>
                Dikirim pada {{ item.tanggal }}
              </p>
              <p class="mb-2">
                <v-icon left>notes</v-icon>
                <strong>Tipe surat:</strong>
                {{ item.jenis_surat }}
              </p>
              <p class="mb-2">
                <v-chip small color="blue" text-color="white">
                  <v-avatar left>
                    <v-icon small>check_circle</v-icon>
                  </v-avatar>Terkirim
                </v-chip>
              </p>
            </v-card-text>
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn outlined color="indigo" small :to="'/dashboard/tampil/' + item.id">Lihat detail</v-btn>
            </v-card-actions>
          </v-card>
        </div>
      </div>
      <!-- <div class="pagination__p">
        <ul>
          <li>
            <button :disabled="pagination.index == 0" @click="prevStep">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="32"
                height="32"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                stroke-width="2"
                stroke-linecap="square"
                stroke-linejoin="arcs"
              >
                <path d="M19 12H6M12 5l-7 7 7 7" />
              </svg> Previous post
            </button>
          </li>
          <li>
            <div class="current_page">Page {{pagination.index+1}} of {{pagination.length}}</div>
          </li>
          <li>
            <button :disabled="pagination.index == pagination.length-1" @click="nextStep">
              Next post
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="32"
                height="32"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                stroke-width="2"
                stroke-linecap="square"
                stroke-linejoin="arcs"
              >
                <path d="M5 12h13M12 5l7 7-7 7" />
              </svg>
            </button>
          </li>
        </ul>
      </div>-->
    </v-container>
  </div>
</template>

<script>
import AOS from "aos";
import "aos/dist/aos.css"; // You can also use <link> for styles
// ..
AOS.init();
export default {
  name: "SuratPreview",
  data: () => ({
    items: [],
    // items_chunk: [],
    // pagination: {
    //   index: 0,
    //   length: 0,
    //   show: 0
    // },
    // disablednext: false,
    // disabledprev: false
    limit: 10,
    busy: false
  }),
  methods: {
    // splitData: function(array, size) {
    //   const chunked_arr = [];
    //   for (let i = 0; i < array.length; i++) {
    //     const last = chunked_arr[chunked_arr.length - 1];
    //     if (!last || last.length === size) {
    //       chunked_arr.push([array[i]]);
    //     } else {
    //       last.push(array[i]);
    //     }
    //   }
    //   return chunked_arr;
    // },
    // nextStep: function() {
    //   window.scrollTo({
    //     top: document.body.offsetTop,
    //     left: 0,
    //     behavior: "smooth"
    //   });
    //   //    console.log(this.pagination.index+1)
    //   if (this.pagination.index == this.pagination.length - 1) {
    //   } else {
    //     return this.pagination.index++;
    //   }
    // },
    // prevStep: function() {
    //   window.scrollTo({
    //     top: document.body.offsetTop,
    //     left: 0,
    //     behavior: "smooth"
    //   });
    //   if (this.pagination.index == 0) {
    //   } else {
    //     return this.pagination.index--;
    //   }
    // },
    removeDuplicates: function(originalArray, prop) {
      var newArray = [];
      var lookupObject = {};

      for (var i in originalArray) {
        lookupObject[originalArray[i][prop]] = originalArray[i];
      }

      for (i in lookupObject) {
        newArray.push(lookupObject[i]);
      }
      return newArray;
    },
    getData: function() {
      this.busy = true;
      this.axios
        .get("/surat")
        .then(response => {
          const append = response.data.data.slice(
            this.items.length,
            this.items.length + this.limit
          );
          this.items = this.items.concat(append);
          this.items = this.removeDuplicates(response.data.data, "judul_surat");

          this.busy = false;

          // this.items = response.data.data;
          // this.items = this.removeDuplicates(response.data.data, "judul_surat");

          // this.items_chunk = this.splitData(response.data.data, 6);
          // this.pagination.length = this.splitData(response.data.data, 6).length;
        })
        .catch(err => {
          console.log(err);
        });
    }
  },
  created() {
    this.getData();
  }
};
</script>

<style lang="scss" scoped>
.pengumuman__list {
  display: grid;
  grid-template-columns: 1fr 1fr;
  grid-gap: 2em;

  @media (max-width: 60rem) {
    grid-template-columns: 1fr;
  }
}

.pagination__p {
  margin: 5em 0;

  ul {
    display: flex;
    justify-content: center;
    align-items: center;

    li {
      button {
        background-color: #111;
        color: #fff;
        padding: 0.5em 1.25em;
        -webkit-border-radius: 30px;
        -moz-border-radius: 30px;
        border-radius: 30px;
        svg {
          vertical-align: middle;
        }
        &:disabled {
          background-color: #ddd;
          color: #111;
          cursor: not-allowed;
          opacity: 0.5;
        }
      }

      .current_page {
        padding: 0.8em 1em;
        margin: 0 1.5em;
      }
    }
  }
}
</style>