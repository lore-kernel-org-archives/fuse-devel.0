Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B308483BF9
	for <fuse-devel@lists.linux.dev>; Thu,  8 Oct 2026 13:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791465631; cv=none; b=OzJlU9FCiyXb0I7pOXjR9GPRqFSt6jajirc7QNQ0tdhla19XTBto4SJf8LROhlI56/uIB0cHrHb0V/cidlq7rQx6QHfGe9pWJXxoATSPgfMEPn26dEI9Om7q16df4K5jH190ny3S2y3A7zMrkzksS6bx5+18ipbxLgn9HLOAHNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791465631; c=relaxed/simple;
	bh=3Wr9/2480/aki5bGWFAs7IixSJIK8jk6h7T+74lKaK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MNcAmuHlD0E3GOmCbDutUqHW0ZRa/mfCOwNTCsHVLdkLk0Mgg7BeITZkgyrz3FCzrCsFpU52Nl05NfRORX+r86/apRFpnPw3SWmwBeYBovi3Qpx1u8sjlwUy18YkvlSwkzBWmapwgK57LOdUOYVOLUBn7FDfgHouhkjkN0z0zwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=XcN9r6CX; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="XcN9r6CX"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48c4649b35bso5138401f8f.3
        for <fuse-devel@lists.linux.dev>; Thu, 08 Oct 2026 06:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1791465628; x=1792070428; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DXt6zdr1dNJCoSR8LDi80DpeRm3wu09nw9+6kVlpfZs=;
        b=XcN9r6CXyjKwQe6R1sA6SgYrsjAteP6HtQvYHYmbsY55i2x2STPNJF7+dsB8xEvsj1
         r6/SrMbj70foC7rGGaOJegJUyQEU21lFhlmHMS/E7VCjKog1k1bh6fYqqhbY1ixg1STe
         YFW33rGT8AFwsfZllt15RTDzhC4XZPpYg4kiYZL13UG12pti3yTqqpWnJiNVBkRiZwnK
         MAC6eySFfTakvpZ+19Nyx30/B0qJr9yNQLwM1y35Ut8+W7HhnX1ptHfNoFUqRp+vKvEm
         G9NaBF+7oOd7JYjJhenn9SOi4NLIrHFjRfKC0iccznMcLcc2RqJhLJQMcFnHuibNak2l
         VzTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791465628; x=1792070428;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DXt6zdr1dNJCoSR8LDi80DpeRm3wu09nw9+6kVlpfZs=;
        b=QVhCj5PoYyENWuQkS9fjJk5VDUpUfwAbJu5/FWpdV4V+Uqqybc0sBx8nCPloLhLFK5
         sY9Xoy/KG+C7A5Av+4h+JcwyQbb717uwOq3nooGyVWS+egiRLfsrn0eQNLyRU8gCW7mh
         ELXDA0TIWD96HbyABW6BmTeLwrbpArjFVYqhaXvLiZ1X9Uc7flJv55xheHEZv5RRayn3
         bN2ba2/dAaPg0mtt84wUY0YS1l9rSV9c3eEXJ7NDnVy0gvoeMQRgn0cYCD+GF83+REoc
         3DIATBQFUebwCS+AK0zzu5ts2Hp4C4DnDlOUG6glkkNhWCP96dFSsPwSJhkJUAgWAeJN
         dqTQ==
X-Gm-Message-State: AFq9FYIudqVQLoW63D6pYeDEqGFANMQFvwEQiQNpYRSQhXoz6bsdEfHo
	odQKIQgMEJUT5OkuKraTGUGFdKxkG9AYfSF1YrcfL/eOf1aru0Rg5uNcdf0nJ8sujGE=
X-Gm-Gg: AYBFou1hsMlklBtHmTfy6HQPv0KoG5GXEdmrV4wTVCjrev1VaokuwZIHGmpezBxlCNE
	r1DW3pYAkvW3itZlswtZhJaAd6Tt9UpgV6M/9cbN2oHPlCWrQUYvgujfjgQuEJYHZVbNkhv27FO
	Cc1AXqpFMvkkjh4yhJjbF2XcN0ob570NihBUBSAlANKoenBs1eXpstUYi42AFSEEn+HbYLq+Xo7
	I3vUTd75pAsM3fyRo1R1znMF0MsROvE0LuEonObXBrvjNyvOW0E60a4nCWr7lK6/Zuh/mvFsJV6
	kx8AWfgKhpspME1XTV7BPb8a9+qn4ylcSuTBkE1jpOxwj9qReZM10lcOXNmZHYv9bY5TIS1T9Sv
	4vwyuM3KeYNZVBHgTsvCUOfJ3eYi6JdIwfIuf6sMW5Q9ekHoviQSwsuA+SbX1hnhnmML33xrsGA
	Rrm4v01QXxOnI1G6U83xfOR57HsG+K78GtOMxDjy+OdxgAg/hXXaHEx8xlT7NhgjEd7nGvvATDF
	3RqlB7jqgo=
X-Received: by 2002:a05:6000:470d:b0:487:c99:9020 with SMTP id ffacd0b85a97d-48c7272887fmr8760021f8f.2.1791465628326;
        Thu, 08 Oct 2026 06:20:28 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([185.194.184.20])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d31767sm11753893f8f.51.2026.10.08.06.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 06:20:27 -0700 (PDT)
Date: Thu, 8 Oct 2026 09:20:23 -0400
From: Gregory Price <gourry@gourry.net>
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: fuse-devel@lists.linux.dev, John Groves <john@groves.net>, 
	Amir Goldstein <amir73il@gmail.com>, "Darrick J . Wong" <djwong@kernel.org>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Alison Schofield <alison.schofield@intel.com>, nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org
Subject: Re: [PATCH v4 2/9] dax: use READ_ONCE() in dax_holder()
Message-ID: <aseYiJO0cgEamazq@gourry-fedora-PF4VCD3F>
References: <20261008112004.1899560-1-mszeredi@redhat.com>
 <20261008112004.1899560-3-mszeredi@redhat.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008112004.1899560-3-mszeredi@redhat.com>

On Thu, Oct 08, 2026 at 01:19:53PM +0200, Miklos Szeredi wrote:
> A future fuse patch will utilize dax_holder() in RCU context to make sure
> that the holder can't be freed by a racing fs_put_dax.
> 
> This patch just makes sure that dax_holder() works properly in such a
> context by adding READ_ONCE() (equivalent to rcu_dereference minus sanity
> checks).
> 
> Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

> ---
>  drivers/dax/super.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dax/super.c b/drivers/dax/super.c
> index 25836f389bde..76e8d3654629 100644
> --- a/drivers/dax/super.c
> +++ b/drivers/dax/super.c
> @@ -642,7 +642,7 @@ EXPORT_SYMBOL_GPL(put_dax);
>   */
>  void *dax_holder(struct dax_device *dax_dev)
>  {
> -	return dax_dev->holder_data;
> +	return READ_ONCE(dax_dev->holder_data);
>  }
>  EXPORT_SYMBOL_GPL(dax_holder);
>  
> -- 
> 2.54.0
> 
