Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1A7305057
	for <fuse-devel@lists.linux.dev>; Mon,  8 Jun 2026 15:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780934375; cv=pass; b=s9FC50TsmpPY83hUJJOKyAcl0ZYohxCMRylQq0Q6zuE7GxKg0lxo58ucSkMJov7gBgU5B/spVfS6CKCldEmzRjgp2lLoYIZ3/P5nipdeHaK5/WUmjrRA5El3OXRt+7OlDpUSLGTXfZOtf2W2SZziwGJhCTlzOCJz8y4R/I/Eouk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780934375; c=relaxed/simple;
	bh=RlWjw+SlaxAwxSpoz0Mc7Eo81foQiYyfWQGsf0HWMnc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xsw8eTd5C06he4vLvEF7TdtRuJIswyytqNLVACp5cMzWszFpzcKVb8ZICe0ljCOQu7mmKfqMdy431V0TzSytJqfeapB+lh48ntCcJEQujLzzyLD56zLlaUF2A2bsZ2Fhqnj0/KjnrHM/d1BbyWqrxaonZo71LFx+S4UPnIeYIpc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=etH45dDB; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="etH45dDB"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-46019edc13dso2090157f8f.1
        for <fuse-devel@lists.linux.dev>; Mon, 08 Jun 2026 08:59:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780934373; cv=none;
        d=google.com; s=arc-20240605;
        b=E23hPchotaGGgjxHS3nEaleabQuH7gFZXDeTtgHTvwiJhjv+jOwiX5rZsrlY0YQ3Qx
         5GpVP/MKHGttqYRsIBGpybIfRcU1km+4cyZVnplArQSrG5iD79rxvpb57SvZuAPVgSy/
         DUChlzBJ/9em8g+bU2tHkhxFMoTLLqs+ubG+/QLrr+i7IRw0OmeeEf4zBJdEb8+bIkcz
         Ubg4BHT1lkMMXbVjgji0ZhC2xV41ntZ3bW5Ar21SOUpuU9cSM51F6N5e/N838p76hC5L
         ms7CarLZwnl1NnaeymS0wyaGH29RwZekDLSfvNQY7K61ivvE9h7SomzrBYJF/vp+0/oA
         cbLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MU06G5twYKFy6QEXux8dF1kPd0hGy8sx+ENDq8z4Mrc=;
        fh=wWT3FRO4qq9LDEIjbEasXHaKNqOErmLg6jE3x7SwVN0=;
        b=JemetK5wGQwfUzN6DTpKPJo1SF3hQm4K0REtCBMuADB3uvUojySQbOfebgdD9yBlEe
         BTEhkDyQfRX459Zebyx5RLWiq56PAjy60pXRBlqwmtXmzRXTORq3LikmClhZ40NMdLFO
         //6cwsq8zDWOGKyD7Vmb187Lxl+0+37pYwiMbBtCYxStYp9rC2w7uqX7/I+/+OotN+iS
         B+vGy4kmVnArEQjaSg/WaNEe4lhbKyJlIhDz10hMZYZxrbshWLLVT0ccaqIqIEIkWNn+
         wyuVwHxfaEa53NnHw/lB636JqNpCmpIjTd0/nEGH5xlYLs6SAIw9lBsozZc6IiJSwl2d
         4QWQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780934373; x=1781539173; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MU06G5twYKFy6QEXux8dF1kPd0hGy8sx+ENDq8z4Mrc=;
        b=etH45dDBRJkINj3CMA3ecVU4pfR7CSsyROargaEyueE0IvJnST/YuHRs1rgq+kOLFp
         tHas87lsTggUvJsS3FmjXGWLMk0uM8f+TYi2LRiwoIa9Y02Du/XK4BEC66L3EGiVEiWU
         LZTltesJC4h7WmQuTamClk1x2FxdscroYE0XbgtO6QRStpFHyqF0cm6c4t8FMmgJ8xxZ
         TIyQc3BCAH4oFqA7bCy61LwnrouBjxiQATDvwBPg+os5nPf2VcrsqidF2RyrL+cSGGOo
         QvJL8eePJFyLCGVaHPPrTLly4KlFfSSPGByVtZ6XZs9zF6niKFMEXh1B/zAgLMAteOvt
         sQNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780934373; x=1781539173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MU06G5twYKFy6QEXux8dF1kPd0hGy8sx+ENDq8z4Mrc=;
        b=ZRZIp9U7Uw7g9lWHClq/e52aJyC3GQredlQlES72Fa+g3x+pbMhuG2XuZfgnfIexa2
         VTnJNjD1SwIknokx+jcfHDbcvikeEZ+aJUmYGHFYFJWKjgYtv7UOodt7Cb++SBno9418
         BFE0wQgTyhS18dkQyQ1vaMW14hMXHPuS0GfRR97DI3rkkFYDTg1TRgkIKwuA5Sk1XuwN
         As9AW/tuj/kY57jEnDraujK5kZCeWDQmf3KgESbBicSvUTVeKkgfuB9HC5jBX4sXWMU3
         UPQknxk1rlt+SAarJuvaUab9Hx/xcZ1h4jetVpiA9RN6Vt1Ul5X9o+dwVI+V1KM+QY/b
         OLlw==
X-Forwarded-Encrypted: i=1; AFNElJ93cbHGDrX00LBsm//CqyFb4196frnkBw4CIyl+CNMEY5AeH7QbXVgfzLwfCHTuJjUfQjFP/vj5uWfv@lists.linux.dev
X-Gm-Message-State: AOJu0YxAgdUzMcF5uKgdV2urpTYZO0ooXNb9A0iSYVzVkhZ2r7HAyiR9
	LtwASRPR9OHxdJPHZnuyaurbCLYs7QMEUq2Bvima1Vi9vt1Rx4JWpPWM4odMqXXa6Q6iRowulYM
	pNBYaQR5aAngYjBdWrcrjTmQxT5TFFIk=
X-Gm-Gg: Acq92OEyivNpsIpg5iH4q4YiOK+7SROBJqk/mRssYbo5Ouzh3rR8lPEviOmPSEeFLPm
	4sDxTXEQsHonwbLQ5WfVzYavuPgINh63YoFyeMJYL8T/LRpXhclfk7ucMs4O9QvYG2jLnChBFWp
	tGbNDihz23Lff7/etir1sYDyRQMf0F2QpifSlSAmhQwiktHpGrU51S5I0rVZQcLFSDihhsWk85U
	+I88tFJejlGM/82fV0es+fyc1QpOB5quNfD9q3xRDASS/19Ix8BX4ozzfP7IlQSOryV9oavEOjp
	MzybAMdGI+g/E3cz
X-Received: by 2002:a05:6000:4384:b0:460:3233:beea with SMTP id
 ffacd0b85a97d-4603233bfddmr14349684f8f.42.1780934372973; Mon, 08 Jun 2026
 08:59:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260522205823.1597313-1-joannelkoong@gmail.com>
 <20260522205823.1597313-10-joannelkoong@gmail.com> <d1d588e9-5d4b-4e3f-8154-e769e9e69f12@linux.alibaba.com>
 <CAJnrk1bSr7B3kp3x8RdZWM+6F6H2h7r-pJhvqxoFpxaOtjF2mQ@mail.gmail.com>
 <CAJnrk1Y5AMZYz8cy9RJHFzYTK=H0we0b9uJiCHQz5EcZaMZzqg@mail.gmail.com> <6ae8fcca-2a48-4555-98cc-930c0dd3589a@linux.alibaba.com>
In-Reply-To: <6ae8fcca-2a48-4555-98cc-930c0dd3589a@linux.alibaba.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 8 Jun 2026 08:59:20 -0700
X-Gm-Features: AVVi8CfQeFUwf_sa7kl6YQegOmaWT40jZ_lAzpBb3ibjpVbzpXYY3RM5Yx3pj7Y
Message-ID: <CAJnrk1ZgaKRhUg2Pwaqe3GD0-BXQWPR9iHzzSPgg3ygfby8gmA@mail.gmail.com>
Subject: Re: [PATCH v3 09/10] fuse: add zero-copy over io-uring
To: Baokun Li <libaokun@linux.alibaba.com>
Cc: miklos@szeredi.hu, bernd@bsbernd.com, jlayton@kernel.org, axboe@kernel.dk, 
	fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2026 at 5:14=E2=80=AFAM Baokun Li <libaokun@linux.alibaba.co=
m> wrote:
>
> On 2026/6/5 05:42, Joanne Koong wrote:
> >>> Hi Joanne,
> >>>
> >>> If a connection abort happens while a zero-copy request is in-flight,
> >>> io_buffer_unregister() is never called. The buf_table slot remains
> >>> occupied and folios stay pinned until the io_uring ring is destroyed.
> >>>
> >>> So perhaps we need to add the corresponding cleanup in
> >>> fuse_uring_entry_teardown(). Otherwise looks good to me:
> >>>
> >>> Reviewed-by: Baokun Li <libaokun@linux.alibaba.com>
> >> Hi Baokun,
> >>
> >> Thanks for reviewing this series.  That's a good point - the io buffer
> >> is unregistered in fuse_uring_req_end() when a request is ended, but
> >> the abort code calls fuse_uring_stop_fuse_req_end(), not
> >> fuse_uring_req_end(). I'll add this in.
> > Revisiting this... I had this cleanup in the series I sent out last
> > December [1] but in order to accommodate unregistration on teardown
> > during the abort race, it requires nontrivial changes to io-uring, as
> > it requires operating on a ring ctx handle but it's tricky to
> > ascertain if the handle is valid or not. I had discussed it with Jens
> > at LPC last year, and we came to the conclusion that it's not worth
> > introducing the complexity to accommodate this specific scenario and
> > it's fine to leave the buffer table slot occupied with pinned folios
> > until the io-uring ring is destroyed.
>
> Hi Joanne,
>
> Thanks for explaining the background.
>
> I think we can handle this with a simple change in
> fuse_uring_entry_teardown(), without any io-uring side modifications:
>
> --- a/fs/fuse/dev_uring.c
> +++ b/fs/fuse/dev_uring.c
> @@ -514,8 +514,14 @@ static void fuse_uring_entry_teardown(struct
> fuse_ring_ent *ent)
>         ent->state =3D FRRS_RELEASED;
>         spin_unlock(&queue->lock);
>
> -       if (cmd)
> +       if (cmd) {
> +               if (ent->zero_copied) {
> +                       io_buffer_unregister(cmd, ent->zero_copy_index,
> +                                            IO_URING_F_UNLOCKED);
> +                       ent->zero_copied =3D false;

Hi Baokun,

Unfortunately, I don't think this fires. For ents in userspace, there
is no cmd associated with the ent. cmds are only valid for an ent when
the kernel hasn't yet "returned" the cmd to userspace (this is
enforced in fuse_uring_send() where ent->cmd gets set to NULL). For
the scenario you're describing (a zero-copy request in-flight in
userspace when the abort hits), the ent is in FRRS_USERSPACE with
ent->cmd =3D=3D NULL, which means the if (cmd) guard above will skip this
logic.

Thanks,
Joanne

> +               }
>                 io_uring_cmd_done(cmd, -ENOTCONN, IO_URING_F_UNLOCKED);
> +       }
>
>         if (req)
>                 fuse_uring_stop_fuse_req_end(req);
>>
