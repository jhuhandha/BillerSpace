<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'login-form',
    'enableClientValidation'=>true,
	'clientOptions'=>array(
		'validateOnSubmit'=>true,
	)
)); ?>

    <div class="form-group">
    	<?php echo $form->labelEx($model,'username', array('class'=>'col-sm-3 control-label')); ?>
        <div class="col-sm-9">
        	<?php echo $form->textField($model,'username',array('class'=>'form-control')); ?>
            <?php echo $form->error($model,'username'); ?>
        </div>
    </div>
	
    <div class="form-group">
    	<?php echo $form->labelEx($model,'password', array('class'=>'col-sm-3 control-label')); ?>
        <div class="col-sm-9">
        	<?php echo $form->textField($model,'password',array('class'=>'form-control')); ?>
            <?php echo $form->error($model,'password'); ?>
        </div>
    </div>

    <div class="form-group">
        <div class="col-sm-offset-3 col-sm-9">
            <div class="checkbox">
                <label>
                    <?php echo $form->checkBox($model,'rememberMe'); ?>
                    <?php echo $form->label($model,'rememberMe'); ?>
		            <?php echo $form->error($model,'rememberMe'); ?>
                </label>
            </div>
        </div>
    </div>


    <div class="form-group last">
        <div class="col-sm-offset-3 col-sm-9">
			<?php echo CHtml::submitButton('Login',array('class'=>'btn btn-success')); ?>
            <button type="reset" class="btn btn-default">Limpiar</button>
        </div>
    </div>


<?php $this->endWidget(); ?>

