Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12514921B1
	for <fuse-devel@lists.linux.dev>; Fri, 14 Aug 2026 17:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786730284; cv=pass; b=N/xK/A0IXeUReNDvwPGDEB5bnGYe0XOgQyTye8LRBBwzc421xsdPTty2YLHt0GTIGQ5SEV/FCGdbiLGfqihay1+DjrSInoHgsXv5e+JOi0tkTBUyqTS98H8VHFaDLVvvwyc9yopNi+yfm8VO8RogGiCHKGugbpLAeIZz6Tp+zxk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786730284; c=relaxed/simple;
	bh=qyMER5sAWqXtKEAWFQA34iZ3QSWVDGDeHsXn3uYaA8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gibzsfifZ3UqxBfxtACkZYSEHAZMC4CvjSh/TfCJAywFsp1uwHbIJGJpYtGfNEsbgiOISfx0rjBwYp+QbfB5NZMhZePEhLpC/7Oc1vL+ZA4M7dAfphCi1cWRGTVGuADxSiNz0mqkbt4wd9hF5l22MSsUrJUQwA2AWzQyS5NH5H4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WaUlkBVt; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WaUlkBVt"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-471eeac43bfso1166079f8f.3
        for <fuse-devel@lists.linux.dev>; Fri, 14 Aug 2026 10:58:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786730281; cv=none;
        d=google.com; s=arc-20260327;
        b=OEvwWzI1CO4qcpeMeJoMcZAcn63iqHtuB6othqQnYIyCsI0V46lKA45KmCrbq8u5Ot
         jynteTRIcaksGHFqfPU1kytjWZA/YI0iOgGWOv5t799nsMDOAgrMhXcbu2Dh3wcPhlEi
         BA9DKwDH6UVwCOzFUapnWHsni2ioeLRZ16r+6qKNdK6JtpE3G+MLuJBoJ6I3MUXeMgA4
         ZRdM3o7MnUVG4AU7NknesyU3YGatpSBnpDqzhLCkFOxf3kjCcp9m7fldtS5mr8Tmf+6s
         2OAs8N696MOKnXA6tmBqv7ZCHkPEVSI8lqkXyRHJ7LRACyWIwsiHIaHnW5GQp1L8QpNh
         5rqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yaL+hQA+HGHLthFy7Tf5WwEacUu3B4FJB161LuLAG0c=;
        fh=qgTp3aeLGKKSiUW0toGid7rnVYPkLuyIxshbflV553w=;
        b=YHgoXqLm31wi36ZwGH0ygd6ITNQOq9GfotVI9953lMQZY6Utu93phMSzmlHCrqk6Uy
         7tGUuIihrgpNpbaTGbeE+FBreVDmyTFhkqB7PL8mIsnDW21Q7Fd7Waf4rXuzCPHivmwY
         /vf69RsZt4dbhWZK+V1bpjKR+NY6LV0ExTqoOT91OBhB2Be+pwZhRkl1PIpF2rxcAPuH
         HdmgolYSss4oiUMdkWDJF877Q+FAcY3n6Qt7GV/8eKtZojjypRfulJ4NeA4XnYuAADEv
         FsSgq+PuKTw3hPr7k7lBmTswhSZ42JrhD6z2jkCdEjmYwYYVcx4clAsQaI6cxkMHSrmc
         Xqmw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786730281; x=1787335081; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yaL+hQA+HGHLthFy7Tf5WwEacUu3B4FJB161LuLAG0c=;
        b=WaUlkBVt4QVudXKda3k8wtSAcWx7WgPnCKiXcLt1puwfVi/sROVDMZzXXLBFZ8NYaN
         P8WRpcH04STV1n08jRsQJZy82P8RwO1vX80BQhrsaLjEvQ2ylVSPTLH4VgmM0s4yA2qx
         ZZXAgDvRgdE9sm506TJP6fTxAlvNuEKu5mv6nX50297BjTckNk2Mb0n13mvQmqcHx0xT
         EGoQnp44hJqhY2ApImO+SHKd9CD2hGwyhnm1pGaNP1XNlhP8Ac/YqdrP3ILwiGb3sGoN
         vR86iaXlNQpMixobAf1ZSMUMDE92zA5HTq23Kibxx3RUPd9gbcZQV3nO7MLX0j5UyF4r
         wyrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786730281; x=1787335081;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yaL+hQA+HGHLthFy7Tf5WwEacUu3B4FJB161LuLAG0c=;
        b=m9GDzmEeCxFjEmqDKEyrtl21na3dFCHq8x4en2f7ZscUaUSJzkneoi6qlhu3Saz+t3
         WPdp6+gNylwlziRVg53qijWI6BJFqAgK87cdlBlsRBbJIIKE910YkDx0i/W2sGaxdC+A
         MHvhVKoq4Z6jRK/4e4its6L2cTYKds8OHHBAU91jnuFeNcy6zKHpyc5Rc7ayFlzLW+gc
         fsKVimVWFqcmcZZcLR8/VPHaYx+oibjbNJSP43rcXK9XPalPF3iad2PKEb+DVXx1ht1F
         CpdWAz98lWRChljokrce9xTDY6FQNjbMWu7DAB6GUNQ0oozy6Od0oZ9l9nvHfPV+fph4
         25Fw==
X-Forwarded-Encrypted: i=1; AHgh+RoIVah3Gg2pBOSRrs/+crKRHRLYWWTS0Jw1ePmkWO5QEZaZj70hS0zNaVV6Aj3y4P7c112TpWuu4XT5@lists.linux.dev
X-Gm-Message-State: AOJu0YweRzF1J6LAh2UUe4A/pUTrQaSCx9hZbvCIYiJo25vJhRzcwGVb
	nGdcIUn5RTQDYAHhjP/oyb7Mr4BXSX6YxZ7vDnVlFdIz1SHObDXLPeJCHm64mKKSoXc4pnV8sE4
	BlhWphMcJSu5DTbHlRKJIcNQF17dTVjo=
X-Gm-Gg: AR+sD12Y2/p8M0ljKUrD0zYoJ8t7FO8kQSiXqxfxeZrDMPXsMATJhAe4Bp6We+AI2B/
	6A89n8983Q8xEj+T3Mlk+j/BNwM6ADyfxZZL/N2bmCtsWlclv+62dq/U8TYNxgqbaRBcYYFUBOL
	s6SN/2ozpWkXUFVew8mL/X9TyWhGiI6BjMyuoGaCbnEXLcEUpHtdzs+VfKm8U5zhZCQdUoN5AS1
	wFr918D/nBCTHeI0Iiz6VoBwlzB2mKOyluW++0fBL4eJ4OAkK7QcFhHUAq8ziPaKhpMxVPOPr7x
	jL/abBavMuhEHIzn9SlnfrajOhVqpld7gqZV0lkbZyV8c+17A0q84uEVrKzIZ4WgiOpPsUZO5oY
	W39CqiLuLu15fNkFlcwW8DAPZ
X-Received: by 2002:a05:6000:18a6:b0:47f:5ec2:d54 with SMTP id
 ffacd0b85a97d-481607351d6mr12830196f8f.5.1786730280918; Fri, 14 Aug 2026
 10:58:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260716175908.2339738-1-joannelkoong@gmail.com>
 <20260716175908.2339738-5-joannelkoong@gmail.com> <a4d759e1-a447-4ae2-8b86-0c724a95541c@bsbernd.com>
In-Reply-To: <a4d759e1-a447-4ae2-8b86-0c724a95541c@bsbernd.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 14 Aug 2026 10:57:49 -0700
X-Gm-Features: AcwNN1WCrNrwSBc86ezL_-9IDF8qDQHEv8jAYfUNR09StTkKgccZOeHMQs_4e1U
Message-ID: <CAJnrk1ZNb_hScX7yB2NRc8RRPSoDG7vM5yLj82AiKgyDTXGnQQ@mail.gmail.com>
Subject: Re: [PATCH v6 4/6] fuse: support registered buffer pools in io-uring
To: Bernd Schubert <bernd@bsbernd.com>
Cc: miklos@szeredi.hu, jlayton@kernel.org, libaokun@linux.alibaba.com, 
	axboe@kernel.dk, amir73il@gmail.com, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 2:09=E2=80=AFPM Bernd Schubert <bernd@bsbernd.com> =
wrote:
>
> > diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
> > index f7173b5d4321..07d12f1c55bb 100644
> > --- a/include/uapi/linux/fuse.h
> > +++ b/include/uapi/linux/fuse.h
> > @@ -246,6 +246,7 @@
> >   *  - add FUSE_HAS_IO_URING_BUFPOOL
> >   *  - add fuse_uring_cmd_req bufpool struct
> >   *  - add bufpool offset field to fuse_uring_ent_in_out struct
> > + *  - add FUSE_URING_REGISTERED_BUFPOOL flag
> >   */
> >
> >  #ifndef _LINUX_FUSE_H
> > @@ -1310,6 +1311,9 @@ enum fuse_uring_cmd {
> >       FUSE_IO_URING_CMD_ADD_BUFPOOL =3D 4,
> >  };
> >
> > +/* fuse_uring_cmd_req flags for FUSE_IO_URING_CMD_ADD_BUFPOOL */
> > +#define FUSE_URING_REGISTERED_BUFPOOL        (1 << 0)
> > +
> >  /**
> >   * In the 80B command area of the SQE.
> >   */
>
>
> I would personally prefer to avoid FUSE_URING_ADD_BUFPOOL_FLAGS and to
> use IORING_URING_CMD_FIXED, unless there is a really compelling reason
> to have a 2nd flag, but I don't have a strong opinion about it.
>
> Reviewed-by: Bernd Schubert <bernd@bsbernd.com>

Happy to remove the flag then for v7. Thanks for reviewing the patches.

Thanks,
Joanne
