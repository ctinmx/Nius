<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Api extends CI_Controller {
    public function index() {
    	$this->load->model("api_model");
    	$id_user = $this->uri->segment(3);
    	$catego = $this->api_model->g_catego();
    	$data["usuario"] = $this->api_model->g_user($id_user);
    	$categorias= $this->api_model->g_categous($id_user);
        $rss=$this->api_model->g_news($categorias);
        $images=$this->api_model->g_images($rss);
        $data["resultado"] =array(
            "catego"=>$catego,
            "categous"=>$categorias,
            "rss"=>$rss,
            "images"=>$images
            );
        $this->load->view('api',$data);
    }
}