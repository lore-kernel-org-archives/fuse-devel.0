Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F7933E360
	for <fuse-devel@lists.linux.dev>; Tue, 18 Aug 2026 16:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787069042; cv=none; b=G4a79STt8XKL+SymIlH2reSvwm6pWcJzcuKrzH/3mSk+I546sNLrrneKLiNPigb7hW1ktW2JU5MV/J6nUR49ZWaJ5U5XBZeawH1QL5XqfhQbUa7Cyg/VfIh+r21D+6cIHfUxPBsnsbWabj413oTWv6pDnlGLN2cWuivURPsdoz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787069042; c=relaxed/simple;
	bh=yIOVKU/661dJhb8zpkIUgAFqvph5rZrZnYSo4XhSzGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jkKvm6ql9CI6ygnoBu3OiH54DhP3x0tkp5FvsNEMRP7xjc4xyjMcmox+4/vSzUy8Ng3VZhw9hnHybHCiyRrXwCZ9R3rQKQubr7K1fyNFIuG8S6orNvM/EFzk7m2k3HqNdg4m183UMLr25BMjytc+Bci1URjh6RB3WPUBvsz/lZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pjz9UMfU; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pjz9UMfU"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aeb8c19017so64961e87.0
        for <fuse-devel@lists.linux.dev>; Tue, 18 Aug 2026 09:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787069038; x=1787673838; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j+g7sibnUXhV3w+7R1/BF67gUhyBqAstSJuKbUpfaSQ=;
        b=pjz9UMfUpwJSVoDk5Fmd+UGPus0Ep7jaCFeBctK3epiWHJ1RAar86Qqk8ZkgBoaDqI
         2vWTab1r+WnRHE/dV0QsXu4kb3j6/RoV9R8gGFLO1iLnGtUFk2AlVy7vK48Td7bng4q4
         whsfSkF90uyEf4IPFG9GfFvs5T0A4yVKKz4AaOnGsQh2gKbmyCmmriYhZnQuwrEh1nhd
         dBD1TL05wwQ1D9Z8IRNlVES3BMjqsf639p/hUlzsaE97gLTygwCpRV6QudULPEcW8SIF
         RYRpaZsb8kIZi9ztpBHqzIwQwirUxP+e3qWMfw+wtA9LWGGYB9vVzzX5Mux8SnbsyUlC
         3/3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787069038; x=1787673838;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j+g7sibnUXhV3w+7R1/BF67gUhyBqAstSJuKbUpfaSQ=;
        b=DwQlwFjWuq4u60HFvPDYN7wsi8QuPGDshCT7XL7UAZa3/HtznLrQlRs1GBcqqh2iSJ
         Nc/R26re+emWTPf26KJplZR293pcdhK0P+zXIWw2hbhiAvfKiitW/mBOrRLtS3AWBl0X
         BgD8Z39m+mKjDWDJGrKKBXiLabt2AlweQkfjb11qNqfOmQxqE9lWlILjh0q+iC/mmli4
         OLYcF9Wtzv/7uMHZSkAbudA/jiwq4Pdgg+/Xii4d3KeVdSopRGYeQLIyTlb0F7QHZZhg
         hBhspvQP1IJVimXAr7AXieZBYfS6Hr0MbllNtWGBEeDg2mBFdB5VQ/8+hEGWuG1RcdSm
         S9pg==
X-Gm-Message-State: AOJu0YycHQP6Su//Q8Bgqvd19AtFaIWOOvV1lg8JIk1xZ4YQLS3DUcth
	I4y85Zqqz+C6zuNn8W6uw6h6XdTKux32ZTyJfXQTpBX+PXwOFV6IszMc
X-Gm-Gg: AR+sD11pRtbuWNAOdtpinQNKCYCdgUgoTivxWoaAYfCMepNopZMaldw1k4H5IlLMFka
	08HZhpYXrfCGYjvgglVxnamGP18tChmS9G0F2+BdrMFsskC6yhHPAOkfpPc1EXpD4Y+FFa1qbw0
	8BRG8gr/BgD3luIM3m8V2lb8LVAWmleStNOf6Zg87X7mceAxWgefBafL14S6xTmqeS0IdY/WZyH
	pxSjzEOnboHGRVkql+8uVFfdyy/S5GuNEkEGWKfXf1wztDO/7CX3kHQFMuEafDekAB9dV+g6t9O
	g1BGI4ffw1evRHSCOvVb/o5YrBSrC5WlQhJEdTWCbowBhSEZYGR++791MA8nfhP+ygqfQJV6qyk
	VqkVOxFWYUl13eSWZstjyQuEwDKJBxpYe22BqB4dqke3zbd7ONRupP3DWG4Klq7WAqmGl8engK1
	RrsziN+4EmhLDqEp7WMW9gIrM4nsVOhSBDon3J1fP9GU1ANuTeOtIZe2VjBOEMKMtIEmMPCfj17
	+7zGaIbPcmce7N0XcV2qQo=
X-Received: by 2002:a05:6512:8399:b0:5b2:a74d:8c52 with SMTP id 2adb3069b0e04-5b470676388mr2278813e87.18.1787069038185;
        Tue, 18 Aug 2026 09:03:58 -0700 (PDT)
Received: from localhost ([77.237.184.107])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46cf960fbsm1386270e87.8.2026.08.18.09.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 09:03:57 -0700 (PDT)
Date: Tue, 18 Aug 2026 19:33:54 +0330
From: Ali Nasrollahi <a.nasrolahi01@gmail.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fuse: ioctl: fix comparison in
 fuse_setup_measure_verity()
Message-ID: <aoSBawbYSlRNUTc-@zephyr>
References: <20260813070629.248821-1-A.Nasrolahi01@gmail.com>
 <CAJfpegv19MoYVsvGP4S4k1n5u5u=za3yNrY4Z7wULHwLcPJ42g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJfpegv19MoYVsvGP4S4k1n5u5u=za3yNrY4Z7wULHwLcPJ42g@mail.gmail.com>

On 26/08/18 10:53AM, Miklos Szeredi wrote:
> On Thu, 13 Aug 2026 at 09:07, Ali Nasrollahi <a.nasrolahi01@gmail.com> wrote:
> >
> > Clang reports a warning in fuse_setup_measure_verity() in
> > fs/fuse/ioctl.c when comparing the `__u16 digest_size` with SIZE_MAX
> > minus the size of `struct fsverity_digest`:
> >
> >         warning: result of comparison of constant 18446744073709551611
> >         with expression of type '__u16' (aka 'unsigned short') is always
> >         false [-Wtautological-constant-out-of-range-compare]
> 
> The warning is right: that condition is never going to succeed.  So
> just remove it?

Well, I wasn't sure why it was there in the first place, so I didn't want
to change the logic. So I'll send the v2 considering your comment.

Thanks,
    Ali
