<template>
  <div class="pa-3">
    <v-container class="pa-5">
      <v-btn class="mb-4" dark color="blue-grey darken-3" to="/dashboard/list_users">
        <v-icon left>arrow_back</v-icon>Kembali ke daftar dosen
      </v-btn>
       <!-- <v-btn class="mb-4" dark color="blue-grey darken-3" to="/dashboard/surat">
        <v-icon left>arrow_back</v-icon>Kembali ke daftar surat
      </v-btn> -->
      <v-row>
        <v-col>
          <v-card class="pa-5">
            <v-list-item three-line>
              <v-list-item-avatar tile size="400" color="grey">
                <embed
                  :src="items[0].file_surat"
                  type="application/pdf"
                  width="100%"
                  height="400px"
                  internalinstanceid="9"
                />
              </v-list-item-avatar>
              <v-list-item-content class="align-self-start">
                <v-list-item-title class="headline mb-3">{{ items[0].judul_surat }}</v-list-item-title>
                <v-list-item-subtitle class="mb-2">
                  <v-icon left>date_range</v-icon>
                  Dikirim pada {{ items[0].tanggal }}
                </v-list-item-subtitle>
                <v-list-item-subtitle class="mb-2">
                  <v-icon left>notes</v-icon>
                  <strong>Tipe surat:</strong>
                  {{ items[0].jenis_surat }}
                </v-list-item-subtitle>
                <v-list-item-subtitle class="mb-2">
                  <v-chip small color="blue" text-color="white">
                    <v-avatar left>
                      <v-icon small>check_circle</v-icon>
                    </v-avatar>Terkirim
                  </v-chip>
                </v-list-item-subtitle>
              </v-list-item-content>
            </v-list-item>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
  </div>
</template>

<script>
export default {
  name: "SuratPreview",
  data: () => ({
    items: [],
    judul_surat: "",
    jenis_surat: ""
  }),
  mounted() {
    this.getData();
  },
  methods: {
    getData: function() {
      this.axios
        .get("/surat?id_surat=" + this.$route.params.id)
        .then(res => {
          this.items = res.data.data;
          console.log(res.data.data);
        })
        .catch(err => {
          console.log(err);
        });
    }
  }
};
</script>