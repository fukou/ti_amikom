<?php
defined('BASEPATH') OR exit ('No direct script access allowed');
require APPPATH . '/libraries/REST_Controller.php';
//mengambil dari tabel Database tb_user
class Admin extends REST_Controller {
    public function __construct()
    {
        parent::__construct();
    }

    public function index_get()
    {
        $id = $this->get('id');
        if ($id == '') {
            $data = $this->db->get('tb_admin')->result();
        } else {
            $this->db->where('id', $id);
            $data = $this->db->get('tb_admin')->result();
        }

        $this->response([ 
            'success' => true,
            'message' => 'API',
            //fungsi result sebagai wadah
            'data'    => $data
        ], 200);

    }

}