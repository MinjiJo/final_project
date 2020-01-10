package kh.finalproject.studybook.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kh.finalproject.studybook.domain.Room;
import kh.finalproject.studybook.service.RoomService;

@Controller
public class RoomController {
	@Autowired
	private RoomService roomservice;
	
	
		//���� �߰� //�������� ���� , �븮��Ʈ ������//
		@RequestMapping(value="/admin", method=RequestMethod.GET)//���� �𵨾غ�� �ٲ����
		public String ADaccess() {
			return "admin/admin_index";
		}
		//���� ���� �̵�
		@GetMapping(value = "/RoomWrite.ro")
		public String board_write() throws Exception {
			return "admin/room_register";
		}
		
	
	 //���� ���� �׼�
	 
	 @GetMapping("/RoomAddAction.ro") public String room_write_ok(Room room,
	HttpServletRequest request) throws Exception{
	
		 
		 return "redirect:RoomList.ro";
	 }
	
		
	
}
