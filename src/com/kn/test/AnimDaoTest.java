package com.kn.test;

import java.util.List;

import com.kn.dao.AnimDao;
import com.kn.entity.Anim;

public class AnimDaoTest {
	
	public static void main(String[] args) throws ClassNotFoundException{
		
		//查询所有的番剧信息
//		AnimDao dao = new AnimDao();
//		List<Anim> anims = dao.findAll();
//		
//		for(Anim anim : anims){
//			System.out.println(anim);
//		}
		
		//番剧名字模糊查询
//		AnimDao dao = new AnimDao();
//		List<Anim> anims= dao.findByAname("海贼");
//		
//		for(Anim anim : anims){
//			System.out.println(anim);
//		}
		
		//查询番剧id
//		AnimDao dao = new AnimDao();
//		Anim anim= dao.findByAid(6);
//		System.out.println(anim);

		
		//新增
//		AnimDao dao = new AnimDao();
//		Anim anim = new Anim();
//		anim.setAname("海贼王女asdasd");
//		anim.setState(2);
//		anim.setYear(2022);
//		anim.setCover("https://pic.feisuimg.com/upload/vod/20220419-1/3c825de4941505554dacc76c8fffdff2.jpg");
//		anim.setLink("http://www.sakanaaa.com/index.php/vod/detail/id/639.html");
//		anim.setContent("《海贼王女》是以主角“菲娜·豪特曼（フェナ・ハウトマン）”的旅途以及成长之路为主轴展开。故事描述，菲娜在与她父亲乘船旅行时受到海贼袭击，仅她一人靠着小艇漂流到了国家公认的风化岛“香格里拉（シャングリラ）”。10 年后，亭亭玉立的菲娜准备展开她首次“工作”的同时，她下定了逃离这座岛的决心。 ");
//		
//		dao.add(anim);
		
		//删除
//		AnimDao dao = new AnimDao();
//		dao.delete(7);
		
		
	}
}
