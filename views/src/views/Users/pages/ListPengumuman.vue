<template>
  <div>
    <v-container class="pa-5">
      <v-app>
        <v-snackbar bottom :timeout="timeout" color="success" v-model="snackbar">
          <v-icon left color="white">done</v-icon>Surat berhasil dikirim
          <v-btn text @click="snackbar = false">Close</v-btn>
        </v-snackbar>

        <v-snackbar bottom color="success" v-model="snackbarDelete">
          <v-icon left color="white">done</v-icon>Dosen berhasil dihapus
          <v-btn text @click="snackbarDelete = false">Close</v-btn>
        </v-snackbar>

        <v-card-title>
          <v-btn class="ma-2" :disabled="disabled" color="primary" @click="kirimConfirm">
            <v-icon left>mdi-mail</v-icon>Kirim Pengumuman
          </v-btn>
          <!-- <v-btn dark color="blue-grey darken-3" @click="dialogAdd = true">
          <v-icon left>add</v-icon>Tambah Dosen
          </v-btn>-->
          <v-spacer></v-spacer>
          <v-text-field
            v-model="search"
            append-icon="search"
            label="Search"
            single-line
            hide-details
          ></v-text-field>
        </v-card-title>

        <!-- item-key="name"
        show-select-->
        <v-data-table
          v-model="selected"
          :headers="headers"
          :items="dosen"
          item-key="id"
          show-select
          :search="search"
          class="elevation-1"
        >
          <template v-slot:item.data-table-select="{ item , isSelected }">
            <v-checkbox
              color="green"
              v-model="item.selected"
              :value="isSelected"
              @change="coba(item.id, item.nama, item.nidn, item.email)"
            ></v-checkbox>
          </template>

          <!-- <template v-slot:item.action="{ item }">
          <v-btn class="ma-2" dark color="primary" @click="kirimConfirm(item.id, item.nama)">
            <v-icon left>mdi-mail</v-icon>Kirim surat
          </v-btn>
          <v-btn
            class="ma-2"
            outlined
            color="success"
            @click="updateConfirmation(item.id, item.nama, item.nidn, item.email, item.kategori), dialogUpdate= true"
          >
            <v-icon left>mdi-pencil</v-icon>Edit
          </v-btn>
          <v-btn class="ma-2" dark color="error" @click="deleteConfirm(item.id, item.nama)">
            <v-icon left>mdi-delete</v-icon>Hapus
          </v-btn>
          </template>-->
        </v-data-table>

        <!-- kirim surat dialog -->
        <v-dialog v-model="dialogSurat" persistent max-width="600px">
          <v-divider></v-divider>
          <v-card class="pa-5">
            <v-card-text>
              <h2 class="mb-5">
                Mengirim surat....
                <!-- Mengirim surat ke
                <span class="purple--text font-weight-bold">{{ nama }}?</span>-->
              </h2>
              <v-divider class="mb-5"></v-divider>
              <v-form ref="form">
                <v-text-field outlined v-model="judul_pengumuman" label="Judul Pengumuman"></v-text-field>
                <v-textarea v-model="isi_pengumuman" outlined label="Isi Pengumuman"></v-textarea>
                <!-- <template v-slot:selection="{ text }">
                  <v-chip small label color="primary">{{ text }}</v-chip>
                </template>-->
                <!-- </v-file-input> -->
              </v-form>
            </v-card-text>
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn outlined @click="reset">Batal</v-btn>
              <v-btn color="primary" @click="sendData">Kirim Pengumuman</v-btn>
            </v-card-actions>
          </v-card>
        </v-dialog>

        <!-- dialog buat kalau emailnya sama -->
        <v-dialog v-model="dialogEmail" max-width="500">
          <v-card class="pa-5">
            <v-card-text>
              <h2 style="line-height:1.5">Email yang Anda masukkan sudah teregistrasi...</h2>
            </v-card-text>

            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="green darken-1" text @click="dialogEmail = false">Oke</v-btn>
            </v-card-actions>
          </v-card>
        </v-dialog>
      </v-app>
    </v-container>
  </div>
</template>

<script>
export default {
  data: () => ({
    headers: [
      {
        text: "Nama",
        align: "left",
        sortable: true,
        value: "nama"
      },
      { text: "Nidn", value: "nidn", sortable: false },
      { text: "Email", value: "email", sortable: false },
      {
        text: "Kategori",
        value: "kategori",
        sortable: false,
        filter: value => {
          return value === "Dosen";
        }
      }
      // { text: "Action", value: "action", sortable: false }
    ],
    tipe_items: [
      { name: "SK Penguji", value: "SK Penguji" },
      { name: "SK Mengajar", value: "SK Mengajar" },
      { name: "SK Dosen Pembimbing", value: "SK Dosen Pembimbing" }
    ],
    dosen: [],
    show: false,
    valid: true,
    lazy: false,
    passwordRules: [
      v => !!v || "Password harus diisi",
      v => v.length >= 6 || "Password harus lebih dari 6 karakter"
    ],
    emailRules: [
      v => !!v || "E-mail harus diisi",
      v => /.+@.+/.test(v) || "E-mail harus valid"
    ],
    search: "",
    tipe_surat: null,
    dialogAdd: false,
    dialogConfirm: false,
    dialogUpdate: false,
    dialogSurat: false,
    dialogEmail: false,
    snackbar: false,
    snackbarDelete: false,
    timeout: 2000,
    judul_pengumuman: "",
    isi_pengumuman: "",
    // file_surat: null,
    id_user: "",
    filter: "Dosen",
    selected: []
  }),
  created() {
    this.getData();
    this.getCurrentUser();
  },
  computed: {
    disabled() {
      return this.selected.length < 1; // or === 0
    }
  },
  methods: {
    multiple: function() {
      console.log();
    },
    getData: function() {
      this.axios
        .get("/user")
        .then(res => {
          this.dosen = res.data.data;
          console.log(this.dosen);
        })
        .catch(err => {
          console.log(err);
        });
    },
    getCurrentUser: function() {
      let userData = JSON.parse(localStorage.getItem("user"));
      this.currentUser = userData[0];
    },
    reset() {
      this.$refs.form.reset();
      this.dialogAdd = false;
      this.dialogUpdate = false;
      this.dialogSurat = false;
      this.dialogConfirm = false;
    },
    sendData() {
      let data_pengumuman = {
        judul_pengumuman: this.judul_pengumuman,
        isi_pengumuman: this.isi_pengumuman,
        id_user: this.selected,
        id_pengirim: this.currentUser.id
      };
      //   console.log(data_pengumuman);
      this.axios
        .post("/pengumuman/multi", data_pengumuman)
        .then(res => {
          this.dialogSurat = false;
          this.snackbar = true;
          console.log(res);
        })
        .catch(err => {
          console.log(err);
        });
    },
    deleteConfirm(id) {
      this.id = id;
      this.dialogConfirm = true;
    },
    kirimConfirm() {
      this.dialogSurat = true;
    },
    updateConfirmation(id, nama, nidn, email, kategori) {
      this.id = id;
      this.nama = nama;
      this.nidn = nidn;
      this.email = email;
      this.kategori = kategori;
    },
    onFilePicked(e) {
      const fr = new FileReader();
      fr.readAsDataURL(e);
      fr.addEventListener("load", () => {
        this.suratURL = e;
        this.suratFile = fr.result; // this is an image file that can be sent to server...
        if (
          e.type ===
          "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
        ) {
          this.suratType = "application/docx";
        } else if (e.type === "application/msword") {
          this.suratType = "application/doc";
        } else {
          this.suratType = e.type;
        }
        console.log(fr.result);
        console.log(e.type);
      });
    },
    coba(id, nama, nidn, email) {
      this.id = id;
      this.nama = nama;
      this.nidn = nidn;
      this.email = email;

      let obj = {
        id: this.id
        // nama: this.nama,
        // nidn: this.nidn,
        // email:this.nidn
      };
      // var arr = [];
      // arr.push(id);
      this.selected.push(obj);

      /*
      selected: [
        {

        },
        {

        }
      ]


      */
      console.log(this.selected);
    }
  }
};
</script>

<style scoped>
.v-btn {
  margin-left: 0px;
  margin-right: 0px;
}

.v-card__title {
  padding: 18px 0px;
}
</style>