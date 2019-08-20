<template>
  <v-app>
    <!-- <v-container fluid
        fill-height>
        <v-layout
          align-center
          justify-center
        >
       <v-flex text-center>
            <svg xmlns="http://www.w3.org/2000/svg" width="60" height="60" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="square" stroke-linejoin="arcs"><path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="8.5" cy="7" r="4"></circle><line x1="18" y1="8" x2="23" y2="13"></line><line x1="23" y1="8" x2="18" y2="13"></line></svg>
             <h1>Anda tidak punya akses</h1>
             <span>Hubungi kaprodi untuk mengaktivasi akun Anda.</span>
       </v-flex>
        </v-layout>
    </v-container>-->

    <v-container>
      <v-card-title>
        <span class="font-weight-bold">Daftar surat</span>
        <v-spacer></v-spacer>
        <v-text-field
          v-model="search"
          append-icon="search"
          label="Search"
          :search="search"
          single-line
          hide-details
        ></v-text-field>
      </v-card-title>
      <v-data-table
        :headers="headers"
        :items="items"
        :search="search"
        :items-per-page="10"
        class="elevation-1"
      >
        <template v-slot:item.action="{ item }">
          <!-- <v-btn v-bind:href="item.file_surat" class="ma-2" outlined color="success">
            <v-icon left>file_download</v-icon>Download
          </v-btn>-->
          <v-btn
            class="ma-2"
            outlined
            color="success"
            @click="showDetail(item.id, item.judul_surat, item.jenis_surat, item.file_surat), dialogPreview= true"
          >
            <v-icon left>remove_red_eye</v-icon>Lihat surat
          </v-btn>
        </template>
      </v-data-table>

      <v-dialog v-model="dialogPreview" persistent max-width="800px">
        <v-card class="pa-2">
          <v-card-text>
            <v-card-title>
              <h4 class="mb-5">
                Detail surat
                <!-- Mengirim surat ke
                <span class="purple--text font-weight-bold">{{ nama }}?</span>-->
              </h4>
              <v-spacer></v-spacer>
              <v-btn fab small color="primary" class="mb-3" @click="dialogPreview = false">
                <v-icon>close</v-icon>
              </v-btn>
            </v-card-title>
            <v-divider></v-divider>
            <v-container>
              <v-row>
                <v-col cols="12" sm="6">
                  <embed
                    :src="file_surat"
                    type="application/pdf"
                    width="100%"
                    height="380px"
                    internalinstanceid="9"
                  />
                </v-col>
                <v-col cols="12" sm="6">
                  <p class="headline font-weight-bold black--text">{{ judul_surat }}</p>
                  <p class="subtitle-1">{{ jenis_surat }}</p>
                  <v-divider class="my-2"></v-divider>
                  <v-btn v-bind:href="file_surat" class="ma-2" outlined color="success">
                    <v-icon left>file_download</v-icon>Download
                  </v-btn>
                </v-col>
              </v-row>
            </v-container>
          </v-card-text>
        </v-card>
      </v-dialog>
    </v-container>
  </v-app>
</template>

<script>
export default {
  data() {
    return {
      search: "",
      headers: [
        {
          text: "Tanggal dikirim oleh kaprodi",
          value: "tanggal"
        },
        {
          text: "Judul surat",
          align: "left",
          sortable: false,
          value: "judul_surat"
        },
        { text: "Tipe surat", value: "jenis_surat" },
        { text: "Action", value: "action" }
      ],
      items: [],
      currentUser: "",
      dialogPreview: false
    };
  },
  mounted() {
    this.getDataUser();
    this.getData();
  },
  methods: {
    getData: function() {
      this.axios
        .get("/surat?id=" + this.currentUser.id)
        .then(res => {
          this.items = res.data.data;
          console.log(res.data.data);
        })
        .catch(err => {
          console.log(err);
        });
    },
    getDataUser: function() {
      let data = JSON.parse(localStorage.getItem("user"));
      this.currentUser = data[0];
    },
    showDetail(id, judul_surat, jenis_surat, file_surat) {
      this.id = id;
      this.judul_surat = judul_surat;
      this.jenis_surat = jenis_surat;
      this.file_surat = file_surat;
    }
  }
};
</script>