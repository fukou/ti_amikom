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
          <v-btn :disabled="disabled" class="ma-2" color="primary" @click="kirimConfirm">
            <v-icon left>mdi-mail</v-icon>Kirim surat
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
          <template v-slot:item.data-table-select="{ item, isSelected, select }">
            <v-checkbox
              color="green"
              v-model="item.selected"
              :value="isSelected"
              @change="coba(item.id)"
              @input="select($event)"
            ></v-checkbox>
          </template>
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
                <v-text-field outlined v-model="judul_surat" label="Judul surat"></v-text-field>
                <v-select
                  outlined
                  v-model="jenis_surat"
                  :rules="[v => !!v || 'This is required']"
                  :items="tipe_items"
                  label="Tipe surat..."
                  item-text="name"
                  item-value="value"
                  required
                ></v-select>
                <v-file-input
                  v-model="file_surat"
                  outlined
                  @change="onFilePicked"
                  ref="files"
                  type="file"
                  placeholder="Unggah dokumen disini..."
                  prepend-icon="mdi-paperclip"
                >
                  <!-- <template v-slot:selection="{ text }">
                  <v-chip small label color="primary">{{ text }}</v-chip>
                  </template>-->
                </v-file-input>
              </v-form>
            </v-card-text>
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn outlined @click="reset">Batal</v-btn>
              <v-btn color="primary" @click="sendData">Kirim surat</v-btn>
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
    nama: "",
    nidn: "",
    email: "",
    password: "",
    kategori: "Admin",
    judul_surat: "",
    jenis_surat: "",
    file_surat: null,
    suratURL: "",
    suratFile: "",
    suratType: "",
    id_user: "",
    filter: "Dosen",
    selected: [],
    selectAll: false,
    maxid: ""
  }),
  updated() {},
  created() {
    this.getMaxId();
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
    getMaxId: function() {
      this.axios
        .get("/max")
        .then(res => {
          this.maxid = res.data.data;
          console.log(res.data.data);
        })
        .catch(err => {
          console.log(err);
        });
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
    checkTipe(value) {
      this.jenis_surat = value;
    },
    sendData() {
      let data_surat = {
        id_surat: this.maxid,
        judul_surat: this.judul_surat,
        jenis_surat: this.jenis_surat,
        id_user: this.selected,
        file_surat: this.suratFile,
        ext: this.suratType
      };

      this.axios
        .post("/surat/multi", data_surat)
        .then(res => {
          this.dialogSurat = false;
          this.snackbar = true;
          setTimeout(
            () =>
              this.$router.replace(
                this.$route.query.redirect || "/dashboard/tampil/" + this.maxid
              ),
            2000
          );
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
    hai(id) {
      this.id = id;
      console.log(this.id);
    },
    coba(id, id_s) {
      this.id = id;
      //this.maxid + 1;
      //var id_s = id_s;
      // this.nama = nama;
      // this.nidn = nidn;
      // this.email = email;
      //   console.log(this.maxid + 1);
      let obj = {
        id: this.id
        //id_surat: id_s
        // nama: this.nama,
        // nidn: this.nidn,
        // email:this.nidn
      };
      // var arr = [];
      // arr.push(id);
      this.selected.push(obj);
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