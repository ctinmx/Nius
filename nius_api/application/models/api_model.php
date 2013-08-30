<?php class api_model extends CI_Model {

    function g_catego() {
        $query = $this->db->get('tbl_categorias');
        return $query->result_array();
    }
    function g_user($id_user){
		$query = $this->db->get_where('tbl_usuario', array('id' => $id_user));
		return $query->result_array();    	
    }
    function g_categous($id_user){
		$query = $this->db->get_where('tbl_categorias_has_tbl_usuario', array('usuario_id' => $id_user));
		return $query->result_array();    	
    }
    function g_news($id_categoria){
        for($i=0;$i<count($id_categoria);$i++){
            $this->db->or_where('categoria_id',$id_categoria[$i]["categoria_id"]);
        }
        $this->db->order_by("categoria_id","asc");
		$query = $this->db->get('tbl_rss');
		return $query->result_array();    	
    }
    function g_images($rss){
        for($i=0;$i<count($rss);$i++){
            $this->db->or_where('id_rss',$rss[$i]["id"]);
        }
        $this->db->order_by("id_rss","asc");
        $query = $this->db->get('tbl_rss_images');
        return $query->result_array();      
    }
}
?>