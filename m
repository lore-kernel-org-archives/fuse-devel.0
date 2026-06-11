Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9B03E6DD8
	for <fuse-devel@lists.linux.dev>; Thu, 11 Jun 2026 15:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781191506; cv=pass; b=JkKZ+OwSZm1DphIbn6O/iK8A0m8+aPipOzHCw52HtpYikggPlawf1gp84DGVxOyhvgbilNxJitwfWxDWsiZqEbJcio+PI4chxWXLAwmNJREQSHdQ/NLoZoAMLBAa4NS7Thc9/kW6AhfE+3aEiQBy3UB3wjn/EgmmRtBd1zE1LUY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781191506; c=relaxed/simple;
	bh=7/Kg3Qim/0orvyP2HvENkP1OF2CtRHsEOgoNKHnyIgU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wf0g299EAD0daHq9V12lkeRyN4WMqbAN2XgYJyc6XZHawCMaCg3CcUY50+uK+WlPyUtISc3qVrHn4ttRWYN/vsaK09T0kTdVVgZgHX2QeDqtyPgw/rVzCRCHXDy80uUStD7cisAWbHlwL4TK1sOtio7IBCqvXgzTVl49kvrkD2k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BtGopPRz; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BtGopPRz"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-45eedcdaeaaso5578078f8f.3
        for <fuse-devel@lists.linux.dev>; Thu, 11 Jun 2026 08:25:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781191503; cv=none;
        d=google.com; s=arc-20240605;
        b=KbMrOjKLql6vvjCQQt9ke9/6xoMk3k8VjyraYPQjdQf2GsRNdin7KiLk3+7UKkMMUq
         myhjkwOyk8Tlsq1kETWAHs/I8r2Sr0jsf/1GBOAJIWI11Z+SiKBJlepwbip8G9kJxqOp
         xcrmx5HfSbJNLgJlWdWAz3cpSIdwt8mxvlxk1gyE9XNadH72fv7Q+NNClWqdQkt+AGL+
         7CG56TVf55Pgp0VeSSZ92o1R/CZzKGC+D9YOgjy4eezmAv0yRYNfa3B/jOWAjIiVLwqi
         DSAx1+oHaurM2TTVrV/cWs8ZX2PtVKHyPeI8W+Ob2ERWkraoX0C6oFQVTcycSDtFjstU
         Gk5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AwRwiX4mGfI2yzsT6+KiEr7sdSFBSM16UIPiC4yPDzA=;
        fh=bQQN47+rZgXj12BMuSrpGx8OalA7fbkyKI4oTKh/QT8=;
        b=CdgyQfyUQooUg6z+w/ns0tw773e8cOv63gCIyosFDmGWdomOLt22x31UJejAwI4NvT
         tI8qI9XYqdTieoSVGxOTUdTjfZGa80i0QQfqoxxOM1CtI+ti9vXer4COC/R0JfpzAixv
         sSM4CVVee/75Ve9qaaEPafSaotmjAikcKcTQC8Bvijrr5sMu044QXyP1Ghem9DBNn9aH
         plyhG+FGFTxrF/EA/ulluckdzi4FFSZbczVPNVhXG+g9BQ3Dr2v3eCObmbQ3ZlEA0S+A
         CkwCLMp4528TfgVvF/0SvmFYOkMMdcOwoMXZWE7PfhIDml0hOujdB9hxJKiZv7fxSc3m
         DqEQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781191503; x=1781796303; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AwRwiX4mGfI2yzsT6+KiEr7sdSFBSM16UIPiC4yPDzA=;
        b=BtGopPRzvHqW4wdQBKmeOMWBuKH0YdYFJgMGnWh8BbemFEg3t9Dh1nntPUcYsKIhik
         6yp6Jm4mX9WXK28NMx8oniJTybprNkk7n1Hx7VA8nFg41XCCAFHagHlfPeRBntVeoZ2U
         56ox/LAVq40U0pNdc3nXRVwzt85YkmFBWhTvP6Nik0Ot/XRQTQ6Ctp5K0EC+Ct37ZeIe
         TjL5MY0E5CTK3nHEprNCxLcwfQsl4pnRPjinYemqE2isI/B8GiwFh3UR1I8Y9t4kLTBK
         HNRHyFJ/yCwjdymfD658icuRoFtagV/lvogWov8RLR8UeHE1g5Gxjh5r/H9Jmk1v0b/q
         NFQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781191503; x=1781796303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AwRwiX4mGfI2yzsT6+KiEr7sdSFBSM16UIPiC4yPDzA=;
        b=PDDU7VnmZfXKHTkQ6LXyiMpDQcvVZu93mJERZVtwzbSDbXD7rZLlUWAkXH5EObY8KQ
         /mi5jwNC2n+jKG5HRiH+Rp7Q2qrKZoNkJa8/qH7VRTMJRgt06zwZpvvORnQsty20QsY+
         2+FBkCsQ0w66KJG0jIVgppH7j8aLnFaI/O2GQoIFH8r1yPhuaFJ8oHNSfR/zA8THCg7f
         iFvnMWQsK/EIphtCUhsE08i1DJqQGtMUpJ34tIWv77QEH0W5j6GVYfrhZULpl+rB/5jZ
         JBoCqnGs8S/Uv2VKX5/zcTRzoSn3O+KtKHGuGgIV9W0fFpHTaSB3bfJcEtEFVaHU40f7
         IBxw==
X-Forwarded-Encrypted: i=1; AFNElJ9JvTgVcxbBmpXd2fPFFLq7fZfW4B2yCF687ksCkuPfQ/dQoDBHVl5sPrXZjyWFIwtTrdODGeryLZ3G@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2t2F7VhExXWYmx1vLRugW2BBx5RvkswwOwlY9JZ99DgNX2AiB
	Rc7IUk22cmSDLgRUej1XtM6sox1vku/swF59AUG3ElyngFJVhJ+pjDNPOVQBOjyYe0wlAia5yAW
	Mc2bL6bcu3ueNZ6FXvVFCSiDiQH5xbuSZy+98R9o=
X-Gm-Gg: Acq92OFliQGzlihHUQtTWwO8eERBOkP2yNmSYnd0kCEVy9/YfIoEaBDnwlsk/xOmRT5
	ZBgidqa3VxANju8Sfb2qoKOUHU8ErSsQ1KoDEVkqD+LFz1dH1cLo9u/TV7uI8rSiG+Gn5GofuJo
	aBZq/jAlZ1YS07alLKM2dr+BqgI/T2JSauFk9MYdDKxKfduCAfFBxt/Ukak30DA3CvAcbhaJOzN
	atZshEwKbySb6043lgFN4JheYP+RzRf/6yC/FOeKVisZLWDVWl7SsmhRa5FYZUFvnwk51fNmtlm
	7Kb/9z3iyX3ThwKgCkG67AKKaAzcqyluXCDCsVSL/DxIpUTOACU6XyXECFFRRc22uoC3uE5z5g=
	=
X-Received: by 2002:a05:6000:29c9:b0:45e:891c:648e with SMTP id
 ffacd0b85a97d-46067478056mr3464870f8f.8.1781191502708; Thu, 11 Jun 2026
 08:25:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260522205823.1597313-1-joannelkoong@gmail.com>
 <CAJnrk1ZPU+BvTCaQ00OwnnXJ8MkwSZ3RyjH9zndL_GuSPfwirA@mail.gmail.com>
 <aeb9c03a-0330-4e41-ad33-b884f00691a0@bsbernd.com> <CAJnrk1YPeeCSsQFjaFNROYcOdBO-kTovOTDkCigNKRt57JREJQ@mail.gmail.com>
 <6ecc45f5-4bce-4af2-bfe4-36c69e624b01@bsbernd.com> <CAJnrk1aS=3KwZ3LpiqcK=gKsj7oru-k-1Xpe2j5puDdmn+hjUA@mail.gmail.com>
 <CAJnrk1aacCbOWWWvW2xnQZ0a954-4shXdyO9LBn_Fv_dyUAWnw@mail.gmail.com>
 <CAJfpegtorFv9u2NCPA8v5OHiBUNT-XzUiw_y=7c3U3WEaXRUZA@mail.gmail.com>
 <CAJnrk1arYPY1u8_aiMfYUbmb9Oy4epRWJp_W7-hjAxQ_ggJn9w@mail.gmail.com> <CAJfpegs7ttuzD14cnEeRBeDnw2E-5Dz=+xCEWVDRCKqMhDZ62A@mail.gmail.com>
In-Reply-To: <CAJfpegs7ttuzD14cnEeRBeDnw2E-5Dz=+xCEWVDRCKqMhDZ62A@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 11 Jun 2026 08:24:49 -0700
X-Gm-Features: AVVi8Cec_uAk13UxMhpfBqM70DSoS9XKUZMhGnwOoGFWqtkxR5AjXcbw-J5gcSA
Message-ID: <CAJnrk1ZbThfvHBfVq_SntuRLFsvHC=DMBQnNcS7Zu4MV9YXTgQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] fuse: add io-uring buffer pools and zero-copy
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Bernd Schubert <bernd@bsbernd.com>, jlayton@kernel.org, axboe@kernel.dk, 
	fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 6:29=E2=80=AFAM Miklos Szeredi <miklos@szeredi.hu> =
wrote:
>
> On Thu, 11 Jun 2026 at 03:51, Joanne Koong <joannelkoong@gmail.com> wrote=
:
>
> > a) I don't see a compelling use case for needing to dynamically
> > add/remove individual buffers from an existing pool. If the server
> > needs more or less capacity, adding/removing a whole pool or queue
> > seems more practical. If we do eventually need single-buffer additions
> > to an existing pool, that can still be layered on to contiguous pools
> > (but removing buffers can't).
>
> If server knows that it will want to remove individual buffers, it
> will just have to register them as separate pools (containing a single
> buffer), right?
>
> Buffer pools are a more generic concept, hence they come with some
> extra complexity and overhead.   But the interface should be a
> superset of what individual buffers provide.
>
> Am I missing something?

The interface is a superset. Internally the difference would be X
bufpools with a single buffer vs 1 bufpool with X single buffers.
There would be more overhead for X bufpools (eg allocating X
fuse_bufpools structs, looking across more bufpools to find a free
buffer). I don't think it would add much additional complexity, given
that multi-bufpool support would also be needed if we wanted to
accommodate different buffer sizes in the same ring.

Does that answer your question or am I misreading what you're asking?

Thanks,
Joanne

>
> Thanks,
> Miklos
