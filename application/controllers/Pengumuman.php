<?php
defined('BASEPATH') or exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';
//mengambil dari tabel Database tb_surat
class Pengumuman extends REST_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->helper(array('form', 'url'));
    }

    public function index_get()
    {
        //mengambil data dari database
        $id = $this->get('id');
        if ($id == null || $id == '') {
            //$data = $this->db->get('tb_pengumuman');
            $this->db->select('*');
            $this->db->from('tb_pengumuman a');
            $this->db->join('tb_user b', 'b.id = a.id_pengirim','left');
            $data = $this->db->get();    
        } else {
           // $data = $this->db->where('id_user', $id);
            //$data = $this->db->get('tb_pengumuman');
            $cek = $this->db->select('status');
            $cek = $this->db->where('id_user',$id);
            $cek = $this->db->get('tb_hak_akses')->row();
            // die(json_encode($cek));
            if($cek->status == "aktif"){            
                $this->db->select('*');
                $this->db->from('tb_pengumuman a');
                $this->db->join('tb_user b', 'b.id = a.id_pengirim','left');
                $this->db->where('a.id_user',$id);
                $data = $this->db->get();                 
            }else{
                $this->db->select('*');
                $this->db->from('tb_pengumuman a');
                $this->db->join('tb_user b', 'b.id = a.id_pengirim','left');
                $this->db->where('a.id_user',$id);
                $this->db->where('status','aktif');
                $data = $this->db->get();
            }  
        }

        //select * from tb_kaprodi
        $this->response([
            'success' => true,
            'message' => 'Daftar Pengumuman',
            //fungsi result sebagai wadah
            'data'    => $data->result()
        ], 200);
    }

    public function index_post()
    {
        //untuk bagian ini penamaan bebas
        $judul_pengumuman    = $this->post("judul_pengumuman");
        $isi_pengumuman      = $this->post("isi_pengumuman");
        $id_user             = $this->post("id_user");
        $id_pengirim         = $this->post("id_pengirim");
        //jika berhasil
        $data = array(
            // "id"            => $id,
            "judul_pengumuman"   => $judul_pengumuman,
            "tanggal"       => date("Y-m-d"),
            "isi_pengumuman"     => $isi_pengumuman,
            "id_user"       => $id_user,
            "id_pengirim" => $id_pengirim
        );
        //simpan ke database
        $simpan = $this->db->insert("tb_pengumuman", $data);

        if ($simpan) {
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

    public function multiple_post()
    {
        $data = null;
        $judul_pengumuman    = $this->post("judul_pengumuman");
        $isi_pengumuman      = $this->post("isi_pengumuman");
        $data_idUser         = $this->post("id_user");
        $id_pengirim         = $this->post("id_pengirim");
        // die();
        $i = 0;
        // $this->response([
        //     "data" => $isi_pengumuman
        // ]);
        // die();
        foreach ($data_idUser as $key => $val) {
            $cek = $this->db->select('status');
            $cek = $this->db->where('id',$val['id']);
            $cek = $this->db->join('tb_hak_akses','tb_user.id = tb_hak_akses.id_user','inner');
            $cek = $this->db->get('tb_user')->row();
            $data[$i] = array(
                // "id"            => $id,
                "judul_pengumuman"   => $judul_pengumuman,
                "tanggal"            => date("Y-m-d"),
                "isi_pengumuman"     => $isi_pengumuman,
                "id_user"            => $val['id'],
                "id_pengirim"        => $id_pengirim,
                "status"             => $cek->status
            );
            $i++;
        }
        // $simpan = false;
        $simpan = $this->db->insert_batch('tb_pengumuman', $data);
        if ($simpan) {
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
        // $surat = $this->db->select('isi_surat');
        // $surat = $this->db->where('id', $id);
        // $surat = $this->db->get('tb_surat')->row();

        $hapus = $this->db->where('id', $id);
        $hapus = $this->db->delete('tb_pengumuman');

        if ($hapus) {
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
