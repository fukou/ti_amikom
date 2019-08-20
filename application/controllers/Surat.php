<?php
defined('BASEPATH') OR exit ('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';
//mengambil dari tabel Database tb_surat
class Surat extends REST_Controller{

    public function __construct()
    {
        parent::__construct();
        $this->load->helper(array('form', 'url'));
    }

    //fungsi Get untuk mengambil data
    public function index_get()
    {
        //mengambil data dari database
        $id= $this->get('id');
        $id_surat = $this->get('id_surat');
        $data = null;
        
        if($id == null || $id == ''){
            if($id_surat == null || $id_surat == ''){
                // $data = $this->db->where('status','tampil');
                $data = $this->db->get('tb_surat');
            }else{
                $data = $this->db->where('id', $id_surat);
                // $data = $this->db->where('status','tampil');
                $data = $this->db->get('tb_surat');
            }
        } else{
            $tgl = date("Y-m-d");
            $cek = $this->db->select('status');
            $cek = $this->db->where('id_user',$id);
            $cek = $this->db->get('tb_hak_akses')->row();
            // die(json_encode($cek));
            if($cek->status == "aktif"){
                $data = $this->db->where('id_user', $id);
                $data = $this->db->get('tb_surat');                 
            }else{
                $data = $this->db->where('id_user', $id);
                // $data = $this->db->where('tanggal <',$tgl);
                $data = $this->db->where('status','aktif');
                $data = $this->db->get('tb_surat');
            } 
        }
        
        //select * from tb_kaprodi
        $this->response([
            'success' => true,
            'message' => 'Daftar Download Surat',
            //fungsi result sebagai wadah
            'data'    => $data->result()
        ], 200);
    }

    public function index_post()
    {
        //untuk bagian ini penamaan bebas
        $judul_surat    = $this->post("judul_surat");
        $jenis_surat    = $this->post("jenis_surat");
        $file_surat     = $this->post("file_surat");
        $id_user        = $this->post("id_user");
        $ext            = $this->post("ext");

        $cek = $this->db->select('status');
        $cek = $this->db->where('id',$id_user);
        $cek = $this->db->join('tb_hak_akses','tb_user.id = tb_hak_akses.id_user','inner');
        $cek = $this->db->get('tb_user')->row();

		// $ext_final = str_replace("application/","",$ext);
		// $file_surat = substr(explode(";",$file_surat)[1], 7);
		// $new_name = $jenis_surat."_".date("d-m-Y")."_".time().".".$ext_final;
		// file_put_contents($_SERVER['DOCUMENT_ROOT']."/kp_amikom/uploads_surat/".$new_name, base64_decode($file_surat));
            //jika berhasil
            $data = array(
                // "id"            => $id,
                "judul_surat"   => $judul_surat,   
                "jenis_surat"   => $jenis_surat,
                "tanggal"       => date("Y-m-d"),
                // "file_surat"    => base_url().'uploads_surat/'.$new_name,
                // "isi_surat"     => $new_name,
                "id_user"       => $id_user,
                "status"        => $cek->status
            );

            //simpan ke database
            $simpan = $this->db->insert("tb_surat",$data);
            // $this->response([
            //     "data" => $data
            // ]);
            if($simpan){
                //berhasil simpan
                $this->response([
                    'success' => true,
                    'message' => 'Data Berhasil Terkirim',
                    'data'    => '404'
                ], 200);
            } else {
                //gagal simpan
                $this->response([
                    'success' => false,
                    'message' => 'Data Gagal Dikirim',
                    'data'    => '404'
                ], 200);
            }
        
    }
    public function max_post(){
        $maxid = 0;
        $row = $this->db->query('SELECT MAX(id) as `maxid` FROM `tb_surat`')->row();
        if(isset($row)){
            $maxid = $row->maxid;
            $this->response([
                'success' => false,
                'message' => 'Data Gagal Dikirim',
                'data'    => $maxid
            ], 200);
        }
    }
    public function multiple_post(){
        $data = null;
        $judul_surat    = $this->post("judul_surat");
        $id_surat       = $this->post("id_surat");
        $jenis_surat    = $this->post("jenis_surat");
        $file_surat     = $this->post("file_surat");
        $ext            = $this->post("ext");
        $data_idUser    = $this->post("id_user");
        //Semisal data user
        // $data_idUser = array(
        //     1,2,3,4,5
        // );

        // $judul_surat = "test judul";
        // $jenis_surat = "test jenis";

		$ext_final = str_replace("application/","",$ext);
		$file_surat = substr(explode(";",$file_surat)[1], 7);
		$new_name = $jenis_surat."_".date("d-m-Y")."_".time().".".$ext_final;
		file_put_contents($_SERVER['DOCUMENT_ROOT']."/kp_amikom/uploads_surat/".$new_name, base64_decode($file_surat));
        $i=0;
        $id_s = $id_surat;
        foreach($data_idUser as $key => $val){
            $cek = $this->db->select('status');
            $cek = $this->db->where('id',$val['id']);
            $cek = $this->db->join('tb_hak_akses','tb_user.id = tb_hak_akses.id_user','inner');
            $cek = $this->db->get('tb_user')->row();
            $data[$i] = array(
                "judul_surat"   => $judul_surat,   
                "jenis_surat"   => $jenis_surat,
                "tanggal"       => date("Y-m-d"),
                "file_surat"    => base_url().'uploads_surat/'.$new_name,
                "isi_surat"     => $new_name,
                "id_user"       => $val['id'],
                "id"            => $id_s,
                "status"        => $cek->status
            );
            $i++;
            $id_s++;
        }
        // $this->response([
        //     "data" => $data
        // ],200);
        // die(json_encode($data));
        $simpan = $this->db->insert_batch('tb_surat',$data);   
        if($simpan){
            //berhasil simpan
            $this->response([
                'success' => true,
                'message' => 'Data Berhasil Terkirim',
                'data'    => '404'
            ], 200);
        } else {
            //gagal simpan
            $this->response([
                'success' => false,
                'message' => 'Data Gagal Dikirim',
                'data'    => '404'
            ], 200);
        }
    }

    public function index_delete()
    {
        $id    = $this->delete('id');
        $surat = $this->db->select('isi_surat');
        $surat = $this->db->where('id', $id);
        $surat = $this->db->get('tb_surat')->row();

        // $this->db->where('id', $id);
        // $hapus = $this->db->delete('tb_surat');
        if($surat != null){
            //fungsi unlink utntuk menghapus file
            unlink("uploads_Surat/" . $surat->isi_surat);
        }
        $hapus = $this->db->where('id', $id);
        $hapus = $this->db->delete('tb_surat');

        if($hapus){
            $this->response([
                'success' => true,
                'message' => 'Data Berhasil Terhapus',
                'data'    => $id
            ], 200);
        } else {
            $this->response([
                'success' => false,
                'message' => 'Data Gagal Dihapus',
                'data'    => '404'
            ], 200);
        }
    }
}