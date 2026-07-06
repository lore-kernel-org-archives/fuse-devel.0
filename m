Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA07018AE3
	for <fuse-devel@lists.linux.dev>; Mon,  6 Jul 2026 21:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783372647; cv=pass; b=ETEjClIS9mFFjl4mmLB6qGwF+MOpfLZ2aP8G6ZMSbJF3W+Trc0/qAour+Jf18kpXnf3RZmKLnUM9vJjJWW+5g1i5QLPaVUIg0LrARq3+nllKJADeDkA+QmxHZR+rFulPUDkFvRtIDcm6etOv34LSla0tsw5IOHU2syrPXELeMxE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783372647; c=relaxed/simple;
	bh=5hmxITQTxU5oqfvuwkA0D6iv8dprKNq4g9zC3xDtX5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NHUtDiJX+gEYc+4Y37FbYXnvpM79nueAc8lWw8OawO/GnarriNw3iTvXPnK3mPX4lTG1AVAXKrC1CD8xnPwd0Lh+5pFR6s6+K6kFnnB3+KJAB/El2rjUdT1kH1c5sma81Vkv08J3eMHj+cEsmmktteBxAczIPlTPhrgMUFe+Z9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ioKiFJ5l; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ioKiFJ5l"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47863f723ccso368049f8f.2
        for <fuse-devel@lists.linux.dev>; Mon, 06 Jul 2026 14:17:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783372644; cv=none;
        d=google.com; s=arc-20260327;
        b=jf8tD/An3nPlQqvcARgaUNR4g0ZK006RzN69nit75JctFEHQu0YeV6JCnQrW35xvI6
         ipGDTWuxqofMp7phkwB+uI+y0BVmhbY2XvJqBZSgFw+rwAfpO9KfDY5wecGSNoJwqtXZ
         RErq9XyMTAZ1nZss3QFziQQ/xS4h70VbmLiy+elKB3ehbS56ZYHD7LJUKIq6dGadgUlj
         dWsr7UNPJH41tg74pgrI4MX3Hr5iPpO11u/+Fl8ZBVRHm+tbTR6HpQHihIVOWrBOHu41
         tjrSubj5e4aoPLKfvZ4zMViBRSrInplEvlDWwnx1+k8GtqEqD0Un1+zzwB/82sUNaE/s
         qa5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N1EH4HvAjzFqB9LAoWjiu/mf8HEDcPE/roQ9Lbcev0E=;
        fh=VUOuy6qBBFqog5wbJyDulkNmCUJTxyzmQOAT8HO8C58=;
        b=TXGvSlR5N+JZAOU3cSFC3H2t3BO2kFCZgxUZK+eI4iZJiGVk3DSSisbZo6kujgy9t8
         lU42OuYON5wjh+m1qyhX9NblZMw7SCyEIWATAba2Vom9oANjuVcH5g5lzJ7PkcNeB526
         i4Ri0hNttUmT/kdEHRpewzEAO0cS3L6Kqh5J1c4Egq/PHpGPyfA64goP5ie1ZXpJqKuS
         ToMCnT0uWB8eo69eiFsgySLaUFxBemM3UDbRFfek7CgVMhClTrvYYqt6j8SjYM/fED3M
         yfw4oceoMUU6INBtMLvF0cD7IeA7jHLeGJwBrf4J9KZQ7Vw+cXxxMYC7OMNGp2b2lSJ7
         GCHg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783372644; x=1783977444; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N1EH4HvAjzFqB9LAoWjiu/mf8HEDcPE/roQ9Lbcev0E=;
        b=ioKiFJ5lQWsfhavTdVhRsv27SJ9C69z0QyM8oJSnboMEBb1skiftvVODzpVuGsiFrL
         pd4nrLAMKEHbFHsWu9FsX8WqJeZaY+ueTfmhz/LQNawX7ns8xcnPvI+w9FE1RzQReWXC
         evmyi9jzU89kdeeTnpl1VaPE6kTpxSJn2NksPQVIg95WvNsMAYGFZe5tbgLfRxVbViDX
         g09SIp8RrFqNK7g2BimcZHMtywuwEtIQcOLUp5fv6xJa6QJI+LXsHmHES4FJaMj0WPE8
         j21cKCHNmE5vpabfWKvcZk/ySWx25tobHsomI4I+XPaECBupn5UTcL+VmcpDD0InsEej
         gMmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783372644; x=1783977444;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N1EH4HvAjzFqB9LAoWjiu/mf8HEDcPE/roQ9Lbcev0E=;
        b=q8qb3UtAzzf2DzMPsDe5iTNVqfCP24hOD2IXgONEt9AL3Nf/vFZ2YDaEINw/EGTc1B
         qDhgrYsvTUgUZV4xRp/1EAF/0sadna5gLH9p0gSK7DCbkf8P3hnzgJv9NxPt98hpPPqM
         K+/zVrNMewuN9u+AkGypHoeP8uG1Lc983LCD+eZB5v54UaAxWnEQWws5Z/e+2Dg3wby3
         FxITVhQo4RZvGEE6UftpRD0sCWUDLDgXuHxtedS9VFeyWtiJl7nNCOacoBrPl8l3nOZZ
         MaTEDP4mpmj2gNke4wHpjbnp8h8tJ8l7fgV2BfuczpZH4t8RR1dwsjl3x1u1P30hE/Mj
         eVgA==
X-Forwarded-Encrypted: i=1; AHgh+RoV8JYWwrZkRn07OP4/48razFOXAfgH+rFrYI+tvIwx6gYtjjHSy+e9oFgYkOyARVDgXi6L9wTAhZKp@lists.linux.dev
X-Gm-Message-State: AOJu0YwVHZGEApP9xs2+ceqa36UZCgAAJ/Wv78Y3KIzOvgz/TDhBHKzg
	Kcceg5uY1L2SL4EZhEEXbQvMxAhdkWziqhLUjSU/f+hlLUgES0mIDHtlcoBug6SNpAi7rH0YHy8
	+hJomDxmoG8l3vZeLEbt5mYek4gTQTFg=
X-Gm-Gg: AfdE7clfleJuwXwPeTUt5DZ8jsbpTRU3W6OCXtyaUrEdrQbOk3g6Di7Sw+XUmFzfDYv
	Yp1GZn/4gURGNRtEEJOA7NUp63TRWED1et2lSHfsOqj4z+aoppiU/lQuYkT1uDNpJW8zZQj4sdR
	x/ahvX9Glo0mCz7STtVrkgcwT/1jCDpHozMb7cK/79Y2/LEI4XrYxDXV0l+vO9EvyxINclV6wDS
	CUaaEmBioGGQOzw9qq9E2JK9AVzcI8Q6Y0I6W5A0ykxmqYZKwan3AzENiuUpRLO3QqQ14n5vGHB
	BOlvYv+xWFfKtXlqc5PJjfx/MBG2L4++7WWZgYk0od6bNjur0vHD
X-Received: by 2002:a05:6000:183:b0:46f:558:a42a with SMTP id
 ffacd0b85a97d-47de66bf0b7mr1654688f8f.34.1783372644027; Mon, 06 Jul 2026
 14:17:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260706191309.2887515-1-xmei5@asu.edu>
In-Reply-To: <20260706191309.2887515-1-xmei5@asu.edu>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 6 Jul 2026 14:17:12 -0700
X-Gm-Features: AVVi8CeLl70LmbEJm89IYL8VaEOLF2oP3HGSFH4iEpvjLG2luGpZkc10MimFUpU
Message-ID: <CAJnrk1Z-6ezCKAEicOEoFVJfhg6Es6R+E=iH4HepmwrpBiETdw@mail.gmail.com>
Subject: Re: [PATCH 1/2] fuse: copy request headers via a stack buffer for io-uring
To: Xiang Mei <xmei5@asu.edu>
Cc: Bernd Schubert <bernd@bsbernd.com>, Miklos Szeredi <miklos@szeredi.hu>, Kees Cook <kees@kernel.org>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Pavel Begunkov <asml.silence@gmail.com>, 
	Luis Henriques <luis@igalia.com>, Weiming Shi <bestswngs@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 12:13=E2=80=AFPM Xiang Mei <xmei5@asu.edu> wrote:
>
> The fuse-io-uring transport copies req->in.h out to the ring in
> fuse_uring_copy_to_ring() and req->out.h back in fuse_uring_commit().
> Both headers live inside the fuse_request slab object, whose cache
> (fuse_req_cachep) is created without a usercopy whitelist, so copying
> them directly to/from userspace trips CONFIG_HARDENED_USERCOPY and
> panics:
>
>   usercopy: Kernel memory exposure attempt detected from SLUB object
>   'fuse_request' (offset 56, size 40)!
>   kernel BUG at mm/usercopy.c:102!
>   RIP: 0010:usercopy_abort+0x6c/0x80
>   Call Trace:
>    __check_heap_object
>    __check_object_size
>    copy_header_to_ring          fs/fuse/dev_uring.c:618
>    fuse_uring_prepare_send
>    fuse_uring_send_in_task
>    ...
>    __do_sys_io_uring_enter
>    entry_SYSCALL_64_after_hwframe
>
> Bounce both headers through an on-stack copy so the usercopy touches
> stack memory, not the slab object.
>
> Fixes: c090c8abae4b ("fuse: Add io-uring sqe commit and fetch support")
> Reported-by: Weiming Shi <bestswngs@gmail.com>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Xiang Mei <xmei5@asu.edu>

Reviewed-by: Joanne Koong <joannelkoong@gmail.com>

I think the cc stable@vger.kernel.org tag is missing here. I added
stable@ to the cc list on this email, but I'm not sure if they require
the tag being explicitly in the commit message to get it backported.

Thanks,
Joanne
