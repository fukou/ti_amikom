<template>
  <div>
    <v-container class="pa-5">
      <div class="pengumuman__list">
        <div v-for="(item, index) in pengumuman" :key="index" cols="md">
          <v-card class="pa-5">
            <v-card-title>
              <h4>{{ item.judul_pengumuman }}</h4>
            </v-card-title>
            <v-card-text>
              <p class="mb-3">
                <v-icon left>person</v-icon>Dikirim oleh
                <b>{{ item.nama }}</b>
                pada {{ item.tanggal }}
              </p>
              <div class="text--primary">{{ item.isi_pengumuman }}</div>
            </v-card-text>
          </v-card>
        </div>
      </div>
    </v-container>
  </div>
</template>

<script>
export default {
  data: () => ({
    pengumuman: [],
    judul_pengumuman: "",
    isi_pengumuman: "",
    tanggal: "",
    currentUser: ""
  }),
  created() {
    this.getData();
  },
  methods: {
    getData: function() {
      // console.log(this.currentUser);
      let data = JSON.parse(localStorage.getItem("user"));
      this.axios
        .get("/pengumuman?id=" + data[0].id)
        .then(response => {
          this.pengumuman = response.data.data;
          this.pengumuman.reverse(); // descending
          //   console.log(response.data.data);
        })
        .catch(error => {
          console.log(error);
        });
    }
  }
};
</script>

<style lang="scss" scoped>
.pengumuman__list {
  display: grid;
  grid-template-columns: 1fr 1fr;
  grid-gap: 2em;

  @media (max-width:60rem) {
    grid-template-columns: 1fr;
  }
}
</style>