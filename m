Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCF73CFF7D
	for <fuse-devel@lists.linux.dev>; Tue, 16 Jun 2026 05:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781588800; cv=pass; b=ExWk5kxt6T5ee4GL4/LQmACHM1+4dq0OAxzsFpS1hP6dWlhZfEiPxDLfg2NE9eFmkILjYQCpJsp2VdVOWyZmyV9pLVb4z9knBCKg+HRQ5gs2SccHzmztzb0flyeei2cdzTCjpaU5wRuzmZ+Zb0QugFZempvhDJyTIU5l6clD2hc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781588800; c=relaxed/simple;
	bh=JPkgZVAqYydPGY27b2Z3jZT/0A+sF4N8EOSbnpeGhw0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WEnUzST1aIUqM/zxgU67wATMNzDWTYKjcIFXItoQ8rcSs8un8d8wovY5U5evKu905XUS3SUQRB+qfEU1KTluEYv48DpoNXQlY+GyLrZTrz64608CVNYkCfmVxKyMeEV1y4oUModClZF5FTlAhPYS3c1spxtMt+hyCbPZLjve9Sw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZeSXmU4k; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZeSXmU4k"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45eecb8bf67so3335125f8f.2
        for <fuse-devel@lists.linux.dev>; Mon, 15 Jun 2026 22:46:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781588798; cv=none;
        d=google.com; s=arc-20240605;
        b=KS2P1xz7gLIlwNQOA0OcbITNVMxBJHICt7fWVivvGQLgEdlYLyyG7Yk8E90ca2OpNp
         Vg4yu5dHSltcwzgswpLNZxZjsSD7Ir4o6H645GJcLszMCvr3JBciztSPPr4jLVUkxxVM
         x166O61tv4Gw6eWzfv9XWNvDKlB6oVnLu8qOyMibr0+Cty0kNFlHp1ROua14OaXf5Jeg
         bEhERlZZpyJUHXKNP/fJ2XhlUvkegd9MOfCqsy/FBcBdvyhKWLs4cbcOZHms21EKDZED
         z8aTNK4dSaOysYbym1UR+psavyI/Cbbyu6syrSFbebvXn/GuS9VJeVGyOqWxd76ACsVO
         z/ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gn66o9ADEj+2hI1xATs+mJ5X5qAwh3wXQ880tbjes3s=;
        fh=8bUFTemOwDoWiOdOkdFFPfADoT45yqq3f7053C+zN1s=;
        b=H4lbqoeppZ4IllxJnaBUJl2+JVVhTI20oZ8cMQORMjCNW4IW5TX3Ubz4dBn6v2G/uW
         s6HdqkSMH4sA67whi8hpv6Wkql1ZAdn3MSKOF6+uXr30Dx0pQgksiW1NNsTsfnPH8zL8
         MYqNBpU8X/thj4U4UIynKDeu1u2mQK5Pwu/0tCJ3pyaufgKB41KT0t9Xwn0CT1wP9apB
         7hHVBBDuuuke5JHIM7HqKATQN6vCXxZCFY+hrlx8+gCg9OPWlIGXoihY+Zoy0D4RtflP
         YDLbWGbLAI9CDvfN0WVMM0id3WFAQjyfQY8Ie+Vow6TCJgTe7uBuOgKSC3LdRojTytQR
         j9aw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781588798; x=1782193598; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gn66o9ADEj+2hI1xATs+mJ5X5qAwh3wXQ880tbjes3s=;
        b=ZeSXmU4kjm26c496R66CTh+hynY/GeBlWYqFNUOfZ70HyXrXirMVyPIcTc2VscWelJ
         gNZvM/PNcqeDErOAcgTLHoz86urlhuas3f/8lKR0VyWjvYRbf/2geanfzu3hNknMOLMu
         yR09d+oj/Hdoyp0lzC0vhIljFKZlUIGq0oREcx3115YadYb7YunUi+h8f5qS226ugRo/
         Yn0XYUztUIjzXAoFamhnZsDUwtIGnWDjNkXYzYoX+2oulWbhFGyNHHuUSUkdnokPXX/V
         qOkiPpEOioQzTYsCTb7bmJPSi6XL+GAZKdqejVe+8WZPR6uq9+rW6+dXa9xerni+9imW
         67aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781588798; x=1782193598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gn66o9ADEj+2hI1xATs+mJ5X5qAwh3wXQ880tbjes3s=;
        b=jCbJKysToOo+7dzSp/V/N2ZCDRyq5fqFUdMpoSnHksXFYsokABVRKmIEycyaEg/UCV
         IEI5RwI7Bd4dSX0skfRkri3yLiJ1wsVQHaPh+IBkeCXxKKVn3Z8Qj+Um21ajdQiwtmbR
         VQD4qak7I+sYxQKFvqa4niKHl0QMGUwZcxNMrzgzzkV03poUx/z8o30pWsypzPwMStHq
         RJC/os3UrlhXIQ4cpNJvseBErjp82m1cUSXF4raTtQrnHswhDZeohNNqSjhfe/f3PdX5
         FXDR1COdbNMshQ3+UiQyoLfjj5/p2TFqdY4bdQUcXCicaATNEa5aegqdPzeSWF63CKou
         Pmgw==
X-Gm-Message-State: AOJu0YwAeo0SHOEC1En7wBEOfoCU6nqQ15InwKN3cxuF/1q1hCnmtOX4
	bh75UjM+fwotLrHq+729iL/SwC9CZBgZNZVkdSExCpukyC6Be8pDTFr+C1DdTLkMweUncLwgw9f
	ufu/OLhhnZutEohO9+Xd14iMqkiwgO15LgZyYT94=
X-Gm-Gg: Acq92OEWQRjOzKUkVEfArQaTyDqd+tvAoQS4igMcNkJdi56bs96gamJb5iwIcEQIzaC
	02X0YgpqHWOTeLkgDzld56jXvqhDw404jwgiUSFSdOiXtuTNURqu7XS7hbXuYlvzkYTsWYuPPu1
	hoEV7DZBpL547kHWgO7WHhLwxXWEW8TWNN3hXHEdz5yt6jS+WogCDiemPWoMjhkfplbeBgfcrB4
	hIcFnmT54i+i7XqI+VfJgKE2K5KYL/GbNy2lrvN3VJB67c780G4YKbBDhsxIeDhF1D6Gm9eegSv
	oNHroOxCm4Kr+bfMFts4LZNJ2AlgIrGLERLSft0lw7hLpYrslpRGQpP5myytHhzqBC4=
X-Received: by 2002:a05:6000:1889:b0:43b:5672:efe with SMTP id
 ffacd0b85a97d-4619f37eb7emr3199369f8f.9.1781588797824; Mon, 15 Jun 2026
 22:46:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260612210513.1516038-1-joannelkoong@gmail.com>
 <20260612210513.1516038-10-joannelkoong@gmail.com> <CAJfpegs+EY+eCDOkBgVWhUyd8hBLE3bFY2oaum-k_tS=Cv2SVQ@mail.gmail.com>
In-Reply-To: <CAJfpegs+EY+eCDOkBgVWhUyd8hBLE3bFY2oaum-k_tS=Cv2SVQ@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Tue, 16 Jun 2026 01:46:25 -0400
X-Gm-Features: AVVi8CcDCp6NRw9e9DCp1OsDcpc9WiTP-_lXfxK7gcoJOb-ZX7psRJg7C143Ue0
Message-ID: <CAJnrk1YiUn3JFZCEe5oADyK5+zx6Rh_6KTZbCzeHUjAebUVQBw@mail.gmail.com>
Subject: Re: [PATCH v4 09/10] fuse: add zero-copy over io-uring
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev, axboe@kernel.dk, jlayton@kernel.org, 
	libaokun@linux.alibaba.com, bernd@bsbernd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 6:05=E2=80=AFAM Miklos Szeredi <miklos@szeredi.hu> =
wrote:
>
> On Fri, 12 Jun 2026 at 23:07, Joanne Koong <joannelkoong@gmail.com> wrote=
:
>
> > The request flow for the zero-copy write path (client writes data,
> > server reads it) is as follows:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > |  Kernel                                   |  FUSE server
> > |                                           |
> > |  "write(fd, buf, 1MB)"                    |
> > |                                           |
> > |  >sys_write()                             |
> > |    >fuse_file_write_iter()                |
> > |      >fuse_send_one()                     |
> > |        [req->args->in_pages =3D true]       |
> > |        [folios hold client write data]    |
> > |                                           |
> > |  >fuse_uring_copy_to_ring()               |
> > |    >copy_header_to_ring(IN_OUT)           |
> > |      [memcpy fuse_in_header]              |
> > |    >copy_header_to_ring(OP)               |
> > |      [memcpy write_in header]             |
> > |                                           |
> > |    >fuse_uring_args_to_ring()             |
> > |      >setup_fuse_copy_state()             |
> > |        [skip_folio_copy =3D true]           |
> > |                                           |
> > |      >fuse_uring_set_up_zero_copy()       |
> > |        [folio_get for each client folio]  |
> > |        [build bio_vec array from folios]  |
> > |        >io_buffer_register_bvec()         |
> > |          [register pages at
> >                  ent->zero_copy_index]      |
> > |        [ent->zero_copied =3D true]          |
> > |                                           |
> > |      >fuse_copy_args()                    |
> > |        [skip_folio_copy =3D> return 0       |
> > |         for page arg, skip data copy]     |
> > |                                           |
> > |    >copy_header_to_ring(RING_ENT)         |
> > |      [memcpy ent_in_out]                  |
> > |    >io_uring_cmd_done()                   |
> > |                                           |
> > |                                           | [CQE received]
> > |                                           |
> > |                                           | [issue io_uring READ at
> > |                                           |  ent->zero_copy_index]
>
> FIXED_READ takes an address, right?  How does all this work at the
> userspace level?

The userspace FIXED_READ call (eg set up usually through the liburing
api io_uring_prep_read_fixed() [1]) takes a buf_index, not an address.
Userspace would pass the ent->zero_copy_index as the buf index.
ent->zero_copy_index corresponds to the fixed buffer where userspace
told the kernel (at sqe registration time through the "uint16_t
zero_copy_index" init param) to place the zero-copied pages for that
sqe.

Thanks,
Joanne

[1] https://man7.org/linux/man-pages/man3/io_uring_prep_read_fixed.3.html
