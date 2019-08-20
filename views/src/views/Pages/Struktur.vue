<template>
  <div>
    <NavBar />
    <div class="container__p">
      <div class="container__p--inner">
        <h1 class="mb-5">Struktur</h1>
        <img src="../../assets/img/strukturprodi_ti1.jpg" alt="Struktur">
      </div>
    </div>
     <Footer />
  </div>
</template>

<script>
import NavBar from "../../components/NavBar";
import Footer from "../../components/Footer";
export default {
  name: "Struktur",
  components: {
    NavBar,
    Footer
  },
   metaInfo: {
    title:
      "Struktur | Prodi Teknik Informatika - Universitas Amikom Purwokerto"
  }
}
</script>

