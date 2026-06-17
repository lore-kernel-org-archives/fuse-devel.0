Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937643E172E
	for <fuse-devel@lists.linux.dev>; Wed, 17 Jun 2026 11:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781695392; cv=pass; b=q9QqYPTiFeeTwIXFSl80LBdcMN4B2lvpTGf1fNYUmffM8Z+ZCFSWUSH8AO5rdkuon8gp5MN4/OpIHqlhDPMSH0bJ2slLVn55zl/EQRkGsDrscyNmHq6mWNhlOeQRquxSpteE6LQ+mznWsgGp7uDeJwLUvasKu0cONHvg9777jGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781695392; c=relaxed/simple;
	bh=oD3DvnVovHIxX+0DbXw9KBNjV96IUrQOdmr1Ac71B6w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T6wWHGVQpic5HMtYyPawb9wbRhKutXOhBUMWv0DOAbDNIl76lllkZlHbfQYDHKVWACLBvf2F38ert0HDjTkG/Wfu6IpVnXjL8Wi3R7tlrcOS42xCD/NZwWwYiX6D5cawBXVg7Ng+9pGlA34ox7xZuamxEtpX+kMfms993krE1eI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cPpKbfem; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cPpKbfem"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490cdae130cso28252605e9.0
        for <fuse-devel@lists.linux.dev>; Wed, 17 Jun 2026 04:23:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781695382; cv=none;
        d=google.com; s=arc-20240605;
        b=gOY8XH3nRJPTeyDdpm4D2IuSK+S7n/jOsNrplAo0LtV2oGcoR2+/xwLsr6+OY6+hys
         QjcyOyDesKWrJyD28LL2wxgE8NkR7tTQAz99jRlsXcSLDUETy3eEEaHYnOkRZ0jIbqEy
         eTUrGPHXUaCqJ4iEpIt3CrSJ1OUtckCvIYM96A/podq9wHNrZj42OW0SToytTCN9wLZH
         nBKoWIOeENrOExcbPcoXbQdBSuVp17bJ6GAB+EbLSXlfklQporLngBZNOxvbTHz6wViL
         /9jF9FHbLatALN8DBjd+58F5LtAiZsn7/r9XvrYVSNQcxHJxLzRoPJadxZVlNV/l7H7g
         BYUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fc0LRftb74TWup33PmKDlrGJlIjKJjk9dKM+rwDokSc=;
        fh=8bUFTemOwDoWiOdOkdFFPfADoT45yqq3f7053C+zN1s=;
        b=E4YLl2KqjBjR97VANytj7yfawGngjM+eDgxNwkDE2V1bfjvMlRREQ15iuY1KPsxVG8
         1p+bVldsBh82NxmYbcyNjNqkpLBT1keTgVTLf2iEbI1euBE+6i+O1s6ADO9ToWX/pSMH
         DChm84DP5YBGXdrmhuUSyNCn7wlLdpvtUJQkKm8C+umpZL2uBG+4UWRiMmV22/Vdmr8B
         +x1XSXt+Yy/cfCHLZZ+ZkNlSGgCpjLaDENR+tYae1aTBLgEXqncoz+SulCh+IaHgD2GG
         +ke2YkuDl7g31cIwOmwtPwsAKwhTDGYaWhMYyvGfRYIlGuhW/YwmoaMIZlhf7iPUUcRS
         s5ng==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781695382; x=1782300182; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fc0LRftb74TWup33PmKDlrGJlIjKJjk9dKM+rwDokSc=;
        b=cPpKbfemtxDpJugyFXR4k12SVskwuhEBxVAUnEL3tmKmCInE3lqsE/2b6upzHgcpWa
         e97rxIVlBlmx5QDYhJtEOnJTUxeULEe3j+ct0K15PAFJxnoo4XAsyqwQNCQgjnwKwDxN
         2r9516z0zTqGmV3ZK8L37T7gogBTS6cAqUBjdAht+mAnibm+NhGmZ5fm1o60pqZfYKfx
         gnd8BGSl4/wnEPT3quRJsyF4QYCVpIrpiEQWuIDjRNiaGHCFqbRqiTxPnTGShNyMuTVY
         1MVlpwT8WO9GsJEhhlpAfRg0Tp/lDY+121P4EBdCODJ5cNoFh7XLZkD9CQ8mvqXuvJKe
         fTIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781695382; x=1782300182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fc0LRftb74TWup33PmKDlrGJlIjKJjk9dKM+rwDokSc=;
        b=OE4EZI2QZS2EKV3w8YixfpJ5zVmNDc45ckcsPSdmxxFc4qsji8c/kwrYh6Gt0gO/ZI
         xp/fzde6GvnF8/j+ttFk/YzNt2bMb7iGIiR0lIEHvwSsyINYOswL3XxVpBFq6hEyZHLk
         H0qsrqd8JRe3+QUfHXG1+1R4grwbMsOt474w6/JDEGgvdKioSrTD+9KYq2Mv/Gd+qNr7
         9pEEtCbZ4yzgdZoetAFtkhw4oNmdxwsI/lNP+XIetYo8MW5+sZaCzi2Ec5wuWKizFVBT
         bKiU9Ufrc3iVxUNVdU//076ze9TSkRWtXhhSl1nfzlNpXalpLO30PRu/GIRZmEOPqTaZ
         rzZg==
X-Gm-Message-State: AOJu0Yy+L8bvsPZS1B/Efj0M74iiqCVLVQkp0V2a8DyFlOWGUICerOGc
	RbE/vrF+vvYd/ccfIzIzvX+pm57JW31cyiGWUPRrQVlttFPkWwCdarz6V0xL7ZvCljww3EEwtik
	Ig80cECak1+4Qu3cQpO7SUeChHR/8itY=
X-Gm-Gg: Acq92OESkA22Vvkt7hLtTlccStkMTb++wqnKwv/ROvISNsXIjIrqTq6y1aZH6ida6ED
	sIM0Yboe6CMOswAe+XMXL0WKO3ZYzDXoa/ZXvyy1PIdd71ayqZSQEJes835dnEeIgvL9xeOWL+W
	ruGGLbYm/pDXuP7dhUJok1yASOdtHCDpBkN1g+NnNnAo2Lt8uxNhRkK5e2vtzMVzgL83SYYlvYy
	VDJNg4oIPHak4vU9xjGoLgdFLL+HbL8jNXry6SZ/wLw8DuJB4PR0KSCa4RVNzUGXK7xRdxfGrhu
	stMjkOBXuOQUByi6ND5A3L96Uvh6KRHe/oCmBBF2FevnppZRYd/73OGc
X-Received: by 2002:a05:600c:6a94:b0:490:d354:bcf4 with SMTP id
 5b1f17b1804b1-492333eb330mr49529455e9.27.1781695381682; Wed, 17 Jun 2026
 04:23:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260612210513.1516038-1-joannelkoong@gmail.com>
 <20260612210513.1516038-10-joannelkoong@gmail.com> <CAJfpegs+EY+eCDOkBgVWhUyd8hBLE3bFY2oaum-k_tS=Cv2SVQ@mail.gmail.com>
 <CAJnrk1YiUn3JFZCEe5oADyK5+zx6Rh_6KTZbCzeHUjAebUVQBw@mail.gmail.com> <CAJfpegvokfiN4b1tEd+fAPfO8n9hSQKeXt6-UM1OzxwHYA5-hw@mail.gmail.com>
In-Reply-To: <CAJfpegvokfiN4b1tEd+fAPfO8n9hSQKeXt6-UM1OzxwHYA5-hw@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 17 Jun 2026 07:22:49 -0400
X-Gm-Features: AVVi8CeG4zsl5uRGZrqbu903jMCfNlksUYZOTNhyQL7DK-qf19GtoqR5-XcdhFs
Message-ID: <CAJnrk1ZTOcAP85qYpFz6w2TPBK+WMdT1B01T5O_gL68BYAOvCQ@mail.gmail.com>
Subject: Re: [PATCH v4 09/10] fuse: add zero-copy over io-uring
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev, axboe@kernel.dk, jlayton@kernel.org, 
	libaokun@linux.alibaba.com, bernd@bsbernd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 5:53=E2=80=AFAM Miklos Szeredi <miklos@szeredi.hu> =
wrote:
>
> On Tue, 16 Jun 2026 at 07:46, Joanne Koong <joannelkoong@gmail.com> wrote=
:
>
> > The userspace FIXED_READ call (eg set up usually through the liburing
> > api io_uring_prep_read_fixed() [1]) takes a buf_index, not an address.
>
> AFAICS buf_index is required, but is not sufficient.  The fixed ops
> require an address as well (to figure out the offset within the
> registered buffer).

For zero-copied registered buffers, the "address" you pass in is the
raw offset into the buffer (eg if you want to read into the
zero-copied buffer starting at offset 4k in the buffer, you would call
io_uring_prep_read_fixed(sqe, fd, (void *)4096, len, file_off,
buf_index);).

On the kernel side, fuse uring calls io_buffer_register_bvec() to
place the application pages or page cache pages into the slot for the
registered buffer [1]. io-uring internally sets that buffer's uaddr as
0 (imu->ubuf =3D 0 in io_kernel_buffer_init() [2]) since the pages are
supplied kernel-side. The liburing io_uring_prep_read_fixed() api will
call into the kernel io_read_fixed() -> io_init_rw_fixed() ->
io_import_reg_buf() -> io_import_fixed(). In io_import_fixed(), the
offset into the fixed buffer is computed with "offset =3D buf_addr -
imu->ubuf" [3] where buf_addr is the u64 representation of the "void
*addr" that was passed into io_uring_prep_read_fixed().

Thanks,
Joanne

[1] https://lore.kernel.org/io-uring/20260612184840.4058966-4-joannelkoong@=
gmail.com/
[2] https://lore.kernel.org/io-uring/20260612184840.4058966-3-joannelkoong@=
gmail.com/
[3] https://elixir.bootlin.com/linux/v7.1/source/io_uring/rsrc.c#L1072
