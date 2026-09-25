Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005D24BC00B
	for <fuse-devel@lists.linux.dev>; Fri, 25 Sep 2026 14:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.233
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790348418; cv=pass; b=gTpUC5fZBmTi7LFjrhiSZvMkR38dczVX3bIhiJ6v8PlzQW/LvpUnhZU7hEC9VfZXhRG32t//Spfa04Z/HujTfBtAjcGKsh2IL2V06RHfI0xKi2Tq/FaD5ywEyu+1JfHtaA7wIWDh/BtM711ZsxZg4tMApxBBU+zJPnpQOLFpV+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790348418; c=relaxed/simple;
	bh=G7PD1SsyWtfXJXkRv2FlPB9lAjfDo8cMbMk/Mdw9V7U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BmiLzet6lr+ZeIReW5FFXh2/NcII4QJCu9dUtn71e94myctuUrO7OXxMXThlD+At5wJF0StEwlaQi3jAzu0MBgs7BFgfob1DnORHxaw6Av2I84LxFwpVgE9BjjoIbBk5RLVAdkKsrGe2YFrHwDFJ771fm31OwdugPlaH+1a/Bzo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=SsaQUPIB; arc=pass smtp.client-ip=74.125.230.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="SsaQUPIB"
Received: by mail-qk2-f41.google.com with SMTP id d75a77b69052e-532c7643bc4so11909711cf.3
        for <fuse-devel@lists.linux.dev>; Fri, 25 Sep 2026 07:59:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790348391; cv=none;
        d=google.com; s=arc-20260327;
        b=q6b/SEzussdlzrEGMWSI/N2tRvB6z3vNAHYlKSRWDUy2ONbbaSpKFNM6CD41QVbwLK
         GQapHeHEOUiWpNTcRFU4UORYdlQXI/Zysk3YBaauCAeBQF3BTseUbT2NMFqYqVqdw1n4
         m60COBKNhRSWTTwW2LEXAHcr/J1FOaa+p8MQr6IUvwFkk8adltLdZ8mPLcYPx3lf8dvC
         MV5DCHX6xySUzckXodcGq5p66K2EkPPPjHWEnG2dZY1xpN/fgCYZ8KB1fuM7DcoldhCL
         RFOuBnwLlfeYCs8uwT4xK7SQwEL5XYiiLbF1TbU0SpoHTWoEAVgd5nMCRagNAIlwEfZM
         wTCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oNCxj1Tkne1Dd9zOhmWp2sMzjpmd3KFTSPzHbdHwTl8=;
        fh=euvGD0GS8EESUv/zkXfrDbqYOVR29Luec7GRKBo1DzQ=;
        b=NmGFJNrIXDeWhziDT0bEHfDIbe3Nd2MkNq1RUEO2PLZNzCl9Y6la9Hw7IW0qW+gU1t
         /ep1xzS9aMl7WA0cveDIOqgHxDOvAtoyp98Pns4/XbfCDeOTd3K6ZEgAXOj+6CqiD5IZ
         THiLM2JgVjiXhJjes1NFWXt9xU+Z3iW47q04UvWBr1znxoc+Ds6imyr5HR39oRy7l0rW
         6yrzM+BZ1Rj3RBu7eoqibeLPNjJnodhva5RqKCJhnCOOzJTXZDp6ZiIszHEnwsD2VFxS
         WzZ6YfSD9NwxxxcXcNCt2a6BQ9+bUzOqgWSw64MZQNVkg3QIdotkt1GL13pnvwVhqcZU
         59rg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1790348391; x=1790953191; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oNCxj1Tkne1Dd9zOhmWp2sMzjpmd3KFTSPzHbdHwTl8=;
        b=SsaQUPIBGdtjUuKptMSIRTlMc+LeY17BXM++0lkkQutiFJudd7gNlt3mjGQ8bqAoUN
         mA+2Ekayz44bH3vER8V091EuQfDwYrCD34JdMX6kACi8+GjSfMqQbKAtvFZ0qDXlvpDZ
         VJhKoCYHdl3oK2/w3xnP6EeBD8Fl4b33zJR10=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790348391; x=1790953191;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oNCxj1Tkne1Dd9zOhmWp2sMzjpmd3KFTSPzHbdHwTl8=;
        b=Az5xkTtE4Z4cu29sF5Xzh8715TbcFRFBitY0goT/xS+xICRj7PF9RA8mQTokt+3IdX
         gZpkLFsSfymIGHJwwo2XDRRc3201lMjQ+f0kY72FO0PLA7KXNinX4Tqjlf+N7nqNMf6u
         oJQNQxjMKy6ZMZMhEB9Q1AdL0koEQYNHfME9MEc67VwqB/SD+nNNF3grtfnJC9t/jm6h
         b5nsbw94wxC3mSMaOT+/uH6FcOS3aiZpz4cJXzuCcYSJqKaxp/g84FKteBWQDUioCaZ5
         kVd/QEOVUjdYj5d7PIQTEuaZro2hIFrvZxWPMYt56J8c1RnJ6lB28OVQW688Jt2UMK1G
         3RKQ==
X-Forwarded-Encrypted: i=1; AKwUvBzPXpkTjNEN7KGzMI5u9yiD7ZNh8nn8pM98WGxxU0NvQC71siI2IQ0OOg1sCXsPwIrg7oj6JYCHljUR@lists.linux.dev
X-Gm-Message-State: AFuF++mVga38ggNCeR6tB8UiYYabf6KOIigEfOHa8yk7FaWnJ9WzYBiN
	PEcshB+oxx1b0xzOFWPgOTLJN55nKOSKsRvbsRmWg1tXXGYresCt7hGYA+EHWDyHgn1KK+mWfoV
	bV1KRT7gRXckhfLP564ySPFOAnK+ixyPOWHojj7siNw==
X-Gm-Gg: AYBFou0c61qYGME4yAFUrHUNkkagEFXmGd1hvrfIrNukjWnJU4rv3nPhhsOtctPINgQ
	ajbOFMRPMq11VPAGHSXc1ibWufm8S+if8NsRbsctpNk+lUSGz0c+23xwPS6Ixi34u3c6nKiW807
	G7m4Or0geIEyIEy4bByaL8/tPWl2WX/AJsnqaRuPn0IubbB8rhEiYzjY6WxfQNlBjFqZFMRBQt8
	VOl41hue1yFpm5vfCyz0SjO5f3gGpEz14oQA946trAPNYqbZsx6dWy+myOKWyl6vDgRCOiTFPxP
	jt7mxHjWN3rlpStAj5eEmX/HdQJEOMwpFbE7vqVZ/QyFO2jJ3z7FdICwMbvE39ykOEURfXj/Ldl
	nRo+3boQxuA==
X-Received: by 2002:a05:622a:508:b0:530:2cc6:c8ad with SMTP id
 d75a77b69052e-5330b5ad6e9mr51539751cf.19.1790348391358; Fri, 25 Sep 2026
 07:59:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260910235110.3922068-1-xmei5@asu.edu>
In-Reply-To: <20260910235110.3922068-1-xmei5@asu.edu>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 25 Sep 2026 16:59:40 +0200
X-Gm-Features: AclHuK8PxhLjayeNK4Ioc2AfP1egLwmVYg_0ZofucCJ6SB6GJuae3F4l1SVQLt0
Message-ID: <CAJfpegsxW3gf6Dj+zVKTTHx8bsASXiMboZ6UWd5WWtBMqd8WZQ@mail.gmail.com>
Subject: Re: [PATCH v8 1/2] fuse: don't BUG when the copy buffer is exhausted
To: Xiang Mei <xmei5@asu.edu>
Cc: Joanne Koong <joannelkoong@gmail.com>, Bernd Schubert <bernd@bsbernd.com>, 
	Baokun Li <libaokun@linux.alibaba.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, fuse-devel@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Luis Henriques <luis@igalia.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, bestswngs@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 11 Sept 2026 at 01:51, Xiang Mei <xmei5@asu.edu> wrote:
>
> fuse_copy_fill() hits BUG_ON(!err) once the iterator backing the copy
> runs out of pages.  Over io-uring the amount copied is not bounded by the
> payload buffer the server registered, so an unprivileged user can drain
> the iterator and panic the host - mount a FUSE filesystem with small
> payload buffers, then setxattr() a larger value:

Applied series, thanks.

Miklos
