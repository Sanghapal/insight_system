class ExamsController < ApplicationController
  # GET /exams
  # GET /exams.json
  load_and_authorize_resource

  def index
    @grade = Grade.find(params[:grade_id])
    @exams = @grade.exams

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @exams }
    end
  end

  # GET /exams/1
  # GET /exams/1.json
  def show
    @exam = Exam.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @exam }
    end
  end

  # GET /exams/new
  # GET /exams/new.json
  def new
    @grade = Grade.find(params[:grade_id])
    @exam = @grade.exams.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @exam }
    end
  end

  # GET /exams/1/edit
  def edit
    @exam = Exam.find(params[:id])
  end

  # POST /exams
  # POST /exams.json
  def create
    @grade = Grade.find(params[:grade_id])
    @exam = @grade.exams.build
    @exam.discription = params[:exam][:discription]
    @exam.exam_date = params[:exam][:exam_date]
    @exam.exam_name = params[:exam][:exam_name]

    respond_to do |format|
      if @exam.save
      if params[:subjects] != nil
        params[:subjects].each do |subject|
          @es = ExamsSubjects.new()
          @es.exam_id = @exam.id
          @es.subject_id = subject
          if @es.save
          end
        end
      end
        format.html { redirect_to setpaper_path(@exam), notice: 'Congratulations! you could assign exam for this grade. ' }

      else
        format.html { render action: "new" }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end
  def setpaper
  @exam = Exam.find(params[:exam_id])
    if request.post?
      @paper = Paper.new()
      @paper.exam_id = @exam.id
    @paper.paper_name = params[:paperName]
      if @paper.save
      if params[:questions] != nil
        params[:questions].each do |q|
        @question = Question.find(q)

        @question.paper_id = @paper.id
        if @question.save
    end
    end
    end
    redirect_to grades_path
    end
    end
  end
  def setting
    @exam = Exam.find(params[:exam_id])
    @paper = @exam.papers.where(:attempt_flag => nil)
    if request.put?
      if params[:papers] != nil
        params[:papers].each do |p|
          @paper = Paper.find(p)
          @paper.attempt_flag = true
          if @paper.save
        end
        end
  end
    redirect_to currentpaper_path(@exam)

    end
  end
  def currentpaper
    @exam = Exam.find(params[:exam_id])
    @paper = @exam.papers.where(:attempt_flag => nil)
    if request.put?
      @p = Paper.find(params[:paper])
      @p.current_paper_flag = true
      if @p.save
        redirect_to grades_path
      end
    end
  end
  def giveexam
    @questions_count = []
    @exam = Exam.find(params[:exam_id])
    @paper = @exam.papers.where(:current_paper_flag => true)
    @paper.last.questions.each do |q|
      @questions_count.push(q.id)
    end
    if request.post?
      @attempt = Attempt.new()
      @attempt.paper_id = @paper.last.id
      @attempt.student_id = current_user.student.id
      @attempt.total_marks = @questions_count.size * 2

      if @attempt.save
        @paper.last.questions.each_index do |i|
          p 'q var is,'
          @q = @paper.last.questions[i]
          if params[@q.id.to_s]
            @option = Option.find(params[@q.id.to_s])
            @option.attempt_id = @attempt.id
            if @option.save
            end
          end
      end
        @get_marks = @attempt.options.where(:option_right => true)
        @calculate_marks = @get_marks.size * 2
        @result = Result.new()
        if @attempt.total_marks > 1 && @attempt.total_marks <= 10 && @calculate_marks >= 4
          @result.result_status = "pass"
          @result.get_marks = @calculate_marks
          @result.min_marks = 4
          @result.total_marks = @attempt.total_marks
        elsif @attempt.total_marks > 10 && @attempt.total_marks <= 20 && @calculate_marks >= 8
          @result.result_status = "pass"
          @result.get_marks = @calculate_marks
          @result.min_marks = 8
          @result.total_marks = @attempt.total_marks

          elsif @attempt.total_marks > 20 && @attempt.total_marks <= 30 && @calculate_marks >= 12
          @result.result_status = "pass"
        @result.get_marks = @calculate_marks
          @result.min_marks = 12
          @result.total_marks = @attempt.total_marks

       elsif @attempt.total_marks > 30 && @attempt.total_marks <= 40 && @calculate_marks >= 16
        @result.result_status = "pass"
          @result.get_marks = @calculate_marks
          @result.min_marks = 16
          @result.total_marks = @attempt.total_marks
        elsif @attempt.total_marks > 40 && @attempt.total_marks <= 50 && @calculate_marks >= 20
          @result.result_status = "pass"
          @result.get_marks = @calculate_marks
          @result.min_marks = 20
          @result.total_marks = @attempt.total_marks
        elsif @attempt.total_marks > 50 && @attempt.total_marks <= 60 && @calculate_marks >= 24
          @result.total_marks = @attempt.total_marks
          @result.result_status = "pass"
          @result.min_marks = 24
          @result.get_marks = @calculate_marks
        elsif @attempt.total_marks > 60 && @attempt.total_marks <= 70 && @calculate_marks >= 28
          @result.total_marks = @attempt.total_marks
          @result.result_status = "pass"
          @result.min_marks = 28
          @result.get_marks = @calculate_marks
        elsif @attempt.total_marks > 70 && @attempt.total_marks <= 80 && calculate_marks >= 32
          @result.total_marks = @attempt.total_marks
          @result.result_status = "pass"
          @result.min_marks = 32
          @result.get_marks = @calculate_marks
        elsif @attempt.total_marks > 80 && @attempt.total_marks <= 90 && @calculate_marks >= 36
          @result.total_marks = @attempt.total_marks
          @result.result_status = "pass"
          @result.min_marks = 36
          @result.get_marks = @calculate_marks
        elsif @attempt.total_marks > 90 && @attempt.total_marks <= 100 && @calculate_marks >= 40
          @result.min_marks = 40
          @result.result_status = "pass"
          @result.get_marks = @calculate_marks
          @result.total_marks = @attempt.total_marks
        elsif @calculate_marks == 0
        @result.result_status = "fail"
          @result.get_marks = @calculate_marks
          @result.total_marks = @attempt.total_marks
        else
          @result.result_status = "fail"
          @result.get_marks = @calculate_marks
          @result.total_marks = @attempt.total_marks
        end
        @result.attempt_id = @attempt.id
        if @result.save
        redirect_to result_path(@result)
        r = @result
        user = User.where(:roles => 'admin').collect(&:email)

        UserMailer.examreport(user, r).deliver
        end
  end
   end
  end
  def result
    @result = Result.find(params[:format])
  end
  # PUT /exams/1
  # PUT /exams/1.json
  def update
    @exam = Exam.find(params[:id])

    respond_to do |format|
      if @exam.update_attributes(params[:exam])
        format.html { redirect_to @exam, notice: 'Exam was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exams/1
  # DELETE /exams/1.json
  def destroy
    @exam = Exam.find(params[:id])
    @exam.destroy

    respond_to do |format|
      format.html { redirect_to exams_url }
      format.json { head :no_content }
    end
  end
end
