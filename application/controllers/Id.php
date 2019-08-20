<?php
defined('BASEPATH') OR exit ('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';
//mengambil dari tabel Database tb_surat
class Id extends REST_Controller{

    public function __construct()
    {
        parent::__construct();
        $this->load->helper(array('form', 'url'));
    }

    //fungsi Get untuk mengambil data
    public function index_get()
    {
        $maxid = 0;
        $row = $this->db->query('SELECT MAX(id) as `maxid` FROM `tb_surat`')->row();
        if(isset($row)){
            $maxid = $row->maxid + 1;
            $this->response([
                'success' => false,
                'message' => 'Data Gagal Dikirim',
                'data'    => $maxid
            ], 200);
        }
    }

    public function index_post()
    {
        
        
    }
    public function max_post(){
        
    }
    public function multiple_post(){
        
    }

    public function index_delete()
    {
    }
}