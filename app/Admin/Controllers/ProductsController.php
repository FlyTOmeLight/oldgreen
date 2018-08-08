<?php

namespace App\Admin\Controllers;

use App\Models\Product;

use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Layout\Content;
use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\ModelForm;

class ProductsController extends Controller
{
    use ModelForm;

    /**
     * Index interface.
     *
     * @return Content
     */
    public function index()
    {
        return Admin::content(function (Content $content) {

            $content->header('商品列表');
//            $content->description('description');

            $content->body($this->grid());
        });
    }

    /**
     * Edit interface.
     *
     * @param $id
     * @return Content
     */
    public function edit($id)
    {
        return Admin::content(function (Content $content) use ($id) {

            $content->header('编辑商品');
            //$content->description('description');

            $content->body($this->form()->edit($id));
        });
    }

    public function update($id)
    {
        return $this->form()->update($id);
    }
    /**
     * Create interface.
     *
     * @return Content
     */
    public function create()
    {
        return Admin::content(function (Content $content) {

            $content->header('创建商品');
//            $content->description('description');

            $content->body($this->form());
        });
    }

    public function store()
    {
        return $this->form()->store();
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Admin::grid(Product::class, function (Grid $grid) {

            $grid->id('ID')->sortable();
            $grid->title('商品名称');
            $grid->on_sale('已上架')->display(function ($value) {
                return $value ? '是' : '否';
            });
            $grid->price('价格');
            $grid->rating('评分');
            $grid->sold_count('销量');
            $grid->review_count('评论数');
            $grid->created_at('创建时间');
            $grid->actions(function ($actions) {
                $actions->disableDelete();
            });
            $grid->tools(function ($tools) {
                // 禁用批量删除按钮
                $tools->batch(function ($batch) {
                    $batch->disableDelete();
                });
            });
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Admin::form(Product::class, function (Form $form) {
            $form->text('title', '商品名称')->rules('required');
            $form->image('image', '封面图片')->rules('required|image');
            $form->editor('description', '商品描述')->rules('required');
            $form->radio('on_sale', '上架')->options(['1' => '是', '0' => '否'])->default('0');
            $form->hasMany('skus', 'Sku列表', function (Form\NestedForm $nestedForm) {
                $nestedForm->text('title', 'SKU名称')->rules('required');
                $nestedForm->text('description', 'SKU描述')->rules('required');
                $nestedForm->text('price', '单价')->rules('required|numeric|min:0.01');
                $nestedForm->text('stock','库存')->rules('required|integer|min:0');
            });

            $form->saving(function (Form $form) {
                $form->model()->price = collect($form->input('skus'))->where(Form::REMOVE_FLAG_NAME, 0)->min('price');
            });

        });
    }
}
