<template>
  <div>
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
  </div>
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
        // {
        //   text: "Status",
        //   value: "status",
        //   filter: value => {
        //     return value === "aktif";
        //   }
        // },
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
          var d = [];
          var filtering = res.data.data.filter(function(data) {
            if (data.status === "aktif") {
              return d.push(data);
            } else {
            }
          });
          this.items = d;
          console.log(d);
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