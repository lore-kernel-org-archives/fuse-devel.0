Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72093CA4BF
	for <fuse-devel@lists.linux.dev>; Tue,  6 Oct 2026 21:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791321877; cv=pass; b=KrFXPQGSTwCHKTXrRGfvjoRqjdbBQ5hvPTtS0X9sVjOUn0W2JADl8KA6Zfy4IXaW7pyi8Wtv1niuQAvGkCphthw3jkqq9VqXAPXIqix1Nr5pZhGN4lWC1G9Pm6DfIkBV6JkX9xVEFPGzJDG+vB7g3BH40vqu08pAC/YBQqW+Ins=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791321877; c=relaxed/simple;
	bh=j1Wh4CfTGvYBOyAROOZOXrtCRg+GLe0bKN/CGF567eM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gvYtZnx9VVfc2Y1TjAF7zAiAlSLcQW9Xsxt1l1DOwktbLBj9JbNEtfEwoBPLbs7u/ra8Jl/bTcgxH8ISutc9wWGivWTtTc+vwG8YkNDDWduF29XNC6HnJ1iNSZs4kFzuP2nhwLDFm7iEEVwzFwEivdLW2RIhHTxUcJkcSyavyZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SQ1/i3QG; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SQ1/i3QG"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6aa97edc48cso2014518a12.3
        for <fuse-devel@lists.linux.dev>; Tue, 06 Oct 2026 14:24:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791321874; cv=none;
        d=google.com; s=arc-20260327;
        b=sKBi4bTZIFW0jzXQbs6+Er0mVR9wgdb3mMkObs9ZMjdcvSIvpGRz4HOyhtqNKdF5x2
         TjiE66Q2eK0rUNhDqCE5e3oqfznWrIywhcBO2TbUDq/GGlkQ0UKMFuclxLlMZnArLFod
         AxEcvAqvPwbxzQC9jBVf6onDkYLo2peCZNL2SZ+uQQB7a14epLnoxpnU+MQM16UcsODK
         D7wehXzM71nl3udfkpPxVQgNKDpuydI1EvEQIrGbDl3OC2SsqVt2gJJkZlyHxOtTowK0
         dfaONwZ9NiPpFTFSDyitO7OOw7f/IrX0yxkpjDxPuydTPT08cEinqzcWxb0cmhCjDvn5
         50pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SYwc8JI6t2v5/H4JTTRJtWLrWEc8ZG38ZE/5tQf+csw=;
        fh=sfpUt7XT4fO2Um4g4uBLaGQR4iPxCKQQO1ygJx7J0CM=;
        b=qvZKM5KarIf+M91ND6xqgr/2dT7cASwQEkDwWAM39obx2CKHoX3Sghs96zO+e3/Jcf
         5wcmRqt1qEERXLnX1xRn548zFrgEliuHL5n6o0SnJ+pODBmwZvSAl7UjfUVYSic+9w5k
         mrwzxwraX4OdwEvMigeT/3XGISmw4DFS7vVi7+WshcavVcn9hJb1CQJU99zJQfeP/mWD
         PEVZXl5PKb6yNdOa/Ofk+7kwEHPjbCTt1I7ZyleJUX9cUu2t0Z2qJKzh0vOIx2SiOfsD
         6iKL/wZ08u2O2H3JFDWSKM6Sz2dG1PXA/0B+uWIyjVuKpG3E6BqdU94642ITiSefBEMy
         evtQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791321874; x=1791926674; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SYwc8JI6t2v5/H4JTTRJtWLrWEc8ZG38ZE/5tQf+csw=;
        b=SQ1/i3QGFbsatvE7AfyR3yBWL94OmmtW8i7SlpEWxwwFVD5MILjZaHNIGDPWmAuSTq
         hjaaPdRQomlIYEEgKlo1kB/Ro9DPWyDKH+UHy/9KZ78aUCzjXlwWl7RYyISvw5ICx60o
         OCJKOT3wVgiEtK4VC/gfWEg5XYOwDgSE/4NURCtWQCFch41INa1qwS/0857hkc846DNX
         V4UBIceXHoe7yiFyJI8jnKmUn6oQlv5XoGKRbjlVLoK+HK19V5zI7ymb1wr1Yd2MybRp
         EULYVu8jeu1PlTy/c9VF1kp1BWsseyy/GRyev3N8vsS33M64aAI+90EVsBLAuJ1iXQeb
         OK2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791321874; x=1791926674;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SYwc8JI6t2v5/H4JTTRJtWLrWEc8ZG38ZE/5tQf+csw=;
        b=GxvEs8Rdz+bWWiA94TMfjDV7cDLxXIM38YF33ZM74OJpiP7YGx11O+xZdFcOMP7RTZ
         1j58aAgr/OZLt67smqa9GhagDosJ9WFJoGqn9cF/epAN/pdkgMt77PsZn0sc+NWeuTld
         5Dlgl0XC3HA4IDJFQy5wHKD7EENWPMjOtIJAhFXEWF0flVvsrAWgD/Sfwv69nNs0tkFj
         QqX2Z6xCelJTfqKAF5JsWi6P7GXhdtEx257C+WeWcn0A3cB5mzHFFuYpZdmqDAUNc9az
         mzInTGrHcBi1T0t9yVdhQw2c79tCyuKue1aXRCZC8XtGj7lYVznwi88ujGdW5zAngheH
         /Q+g==
X-Forwarded-Encrypted: i=1; AKwUvBxZAmCm6aLSa6ak4i5H5225+ErfvpQYeV/vqsDdeOIzhCshfWeuglkWxzQgiRdxgEdQqphf51bW42lm@lists.linux.dev
X-Gm-Message-State: AFq9FYLrJGNoI+VO/7ECyeKtPAwx11hUtsRykBdweRjgzYIsk80+ExBM
	7Qh7vOaRYLrR3oUdQ6QTTJDzWkwcOyaiZIUXkZp63T81dTWC9fFCROQ8RO5qqAaOSyN7NIuMw3v
	vroCSx6OZtzDUrqfGwb7GKQH8K/s7SN4=
X-Gm-Gg: AYBFou0LiQp3jaycteAvfKec3B3qRk5iUmm8q15TTyqnDlQ2bEV3wqUfO8FaI4WFMhP
	aakCPY4qhb5ebxaynTFCcxqqIGTV6ezXa/HMOcP0ywi8C+MHWnGMRbP8sQOm37kwvLLODVw1/Po
	IAx6h5TAWtp3mIK86A/Ur/Cq0FT50lT2OchlDWVXKKjAiYR/RKf4gvmmGW37w9k+3t3p3ZDk3pM
	eMcMLxbnpahEUR7U1mc0x4WnA/St4nQPRn8kQymz7m+xm1+Zybn4BYVXTfcBAqz3AsLPld0kleO
	u7l4WMfdXmPJ8v43+swjQZpfmA2PI0eEyxRQoPPSN7HCPzhAOlFeGyvGHTfynsGFdCMQeDS4+LF
	/+Hv/845bq0o=
X-Received: by 2002:a05:6402:21d7:b0:6ab:7700:9371 with SMTP id
 4fb4d7f45d1cf-6aff47b52d7mr243717a12.25.1791321873525; Tue, 06 Oct 2026
 14:24:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261001150935.655979-1-mszeredi@redhat.com> <20261001150935.655979-4-mszeredi@redhat.com>
 <CAOQ4uxjWCRs59Qpc4t+2=i67rdJkHt=+rH07ZXv7ZzAvTjTm-A@mail.gmail.com>
 <CAOQ4uxi1+WgHJdnRKMD3tp24EOyx7iPByzSKLn_siTVY3_sRDQ@mail.gmail.com> <CAJfpegttAHQAGhE61t-VZqfQv9Z==ovbyLY6qp3KOK_CvjBciA@mail.gmail.com>
In-Reply-To: <CAJfpegttAHQAGhE61t-VZqfQv9Z==ovbyLY6qp3KOK_CvjBciA@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 6 Oct 2026 23:24:17 +0200
X-Gm-Features: AclHuK_VeO0DSevIgJfwzhinVGoS4FTfS8bmWH03wQQ5EUrXtEm_7IyCpO31gUM
Message-ID: <CAOQ4uxj76PJiumvXLHoJUKx_=FAueg3WQjYd64=B_TXo581POg@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] fuse: support 64 bit, server allocated backing ID
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Miklos Szeredi <mszeredi@redhat.com>, fuse-devel@lists.linux.dev, 
	John Groves <john@groves.net>, "Darrick J . Wong" <djwong@kernel.org>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Alison Schofield <alison.schofield@intel.com>, nvdimm@lists.linux.dev, 
	linux-cxl@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 5, 2026 at 3:33=E2=80=AFPM Miklos Szeredi <miklos@szeredi.hu> w=
rote:

> > > It would feel a little less hacky if we do:
> > >     else
> > >           fuse_backing_files_init_32(fc);
> > >
> > > and set
> > >          fc->passthrough =3D 1;
> > >
> > > inside both of them to gate against fuse_backing_files_free()
> > > called without processing init response,
> > > or without either FUSE_PASSTHROUGH in the init response.
>
> Bigger problem is that IOC_BACKING_OPEN can be done before or during
> INIT.  So we need to take care of that case and the race as well.
> Fixed by:
>
>  - leaving the idr initialization fuse_conn_init()
>
>  - adding fc->backing_id_32 flag which is set by fuse_backing_open()
> after chekcking that fc->backing_id_64 is not set.  All under fc->lock
>
>  - in process_init_reply() checking fc->backing_id_32 before setting
> fc->backing_id_64 and failing the connection if so.  Also under
> fc->lock
>
>  - in fuse_dev_ioctl_backing_create() if fch->initialized is not set
> return ENOTCONN
>

I guess that works, but why the asymmetry between the two modes?

We could check fch->initialized in both _open() and _create()
and then no need for the backing_id_32 flag?

Unless we gate _open() with fch->initialized, then it could fail on
either one of these cases:

                if (!fc->passthrough || !capable(CAP_SYS_ADMIN))
                        return -EPERM;

                if (inode->i_sb->s_stack_depth >=3D fc->max_stack_depth)
                        return -ELOOP;

Quite randomly.

Maybe I am missing something.

Thanks,
Amir.
