package com.siva.binding;

import java.util.ArrayList;
import java.util.List;
import com.siva.entity.QuestionStoringEntity;
import lombok.Data;

@Data
public class QuestionListForm {

	private List<QuestionStoringEntity> questions = new ArrayList<>();

}