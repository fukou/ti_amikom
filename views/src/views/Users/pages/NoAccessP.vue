<template>
  <div>
    <v-container class="pa-5">
      <v-row>
        <v-col v-for="(item, index) in pengumuman" :key="index" cols="md">
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
        </v-col>
      </v-row>
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