<?php
defined('BASEPATH') OR exit ('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';
//mengambil dari tabel Database tb_hak_akses
class Hak_Akses extends REST_Controller {

    public function __construct()
    {
        parent::__construct();
        
    }
    //Fungsi Get untuk mengambil data
    public function index_get()
    {
        //mengambil data dari database
        $data = $this->db->get('tb_hak_akses');
        $this->response([
            'success' => true,
            'message' => 'API',
            //fungsi result sebagai wadah
            'data'    => $data->result()
        ], 200);
    }
    public function index_post()
    {
        $id_user    = $this->post("id_user");
        $status     = $this->post("status");
        //berfungsi untuk 
        $this->db->where ('id_user', $id_user);
        $cek_id = $this->db->get ('tb_hak_akses')->num_rows();
        //var_dump($cek_id);
       
        //fungsi $cek_id adalah ketika ada id_user 1 maka akan update
        if ( $cek_id >= 1 ){
            $data   = array (
                'id_user'   => $id_user,
                'status'    => $status
            );
        

            $this->db->where('id_user', $id_user);
            $ubah = $this->db->update('tb_hak_akses', $data);
            
            $ids = $this->db->select('id,status');
            $ids = $this->db->order_by('id','desc');
            $ids = $this->db->get('tb_surat')->row();
            
            if($ids->status == "tidak aktif"){
                $data_surat = array(
                    "status" => "aktif"
                );
                $ubah_surat = $this->db->where('id_user',$id_user);
                $ubah_surat = $this->db->where('id',$ids->id);
                $ubah_surat = $this->db->update('tb_surat',$data_surat);

                $ubah_pengumuman = $this->db->where('id_user',$id_user);
                $ubah_pengumuman = $this->db->where('id',$ids->id);
                $ubah_pengumuman = $this->db->update('tb_pengumuman',$data_surat);
                
            }

            if($ubah) {
                $this->response([
                    'success' => true,
                    'message' => 'Data Berhasil Terkirim',
                    'data'    => '404'
                ], 200);
            } else {
                $this->response([
                    'success' => false,
                    'message' => 'Data Gagal Dikirim',
                    'data'    => '404'
                ], 200);
            }
            
        } else {
            //fungsi ini adalah untuk update *status= aktif / tidak aktif*
            $data = array(
                "id_user" => $id_user,
                "status"  => $status
            ); 
            
        $simpan = $this->db->insert("tb_hak_akses", $data);
        if($simpan) {
            $this->response([
                'success' => true,
                'message' => 'Data Berhasil Dikirim',
                'data'    => '404'
            ], 200);
        } else {
            $this->response([
                'success' => false,
                'message' => 'Data Gagal Dikirim',
                'data'    => '404'
            ], 200);
                }
            }       
        }
}