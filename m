Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFB33F9294
	for <fuse-devel@lists.linux.dev>; Wed,  8 Jul 2026 07:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783497014; cv=none; b=eJ57pTSrLaLK5FaYwLXodY9UB7OZcKUBkT0RxO0cPJuZ5E5XcLJki4zbKHAOS1EQn28xREYv+BGa9DBOwdFAu5rGS3m5YnXAkgUVZpRHix2PHp7i6X5HQrH+zabLOjuNwSynnWoygNkx2zaWC0HayACRad9Sm5dQh+Kw/WzsTh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783497014; c=relaxed/simple;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ocFEul9OpPnH1/evAmK81WPfSwtQEsnSf35/tFdQaAh7wd/l9KFhxrUDheB9ldMpt81+9OiwhHZKyeu8AnRWnmr/5mg2XU+QQHbIjlVGHmU9ERq4Lpv0PPPcPItQsLihPgRvIBlGxPRmNJhygrvf94jvnHtnQy5sYV/SL4NtdOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id D0D1368B05; Wed,  8 Jul 2026 09:49:48 +0200 (CEST)
Date: Wed, 8 Jul 2026 09:49:48 +0200
From: Christoph Hellwig <hch@lst.de>
To: Joanne Koong <joannelkoong@gmail.com>
Cc: brauner@kernel.org, djwong@kernel.org, miklos@szeredi.hu,
	willy@infradead.org, linux-fsdevel@vger.kernel.org,
	fuse-devel@lists.linux.dev
Subject: Re: [PATCH v3 1/3] fuse: don't clear folio uptodate on
 writethrough errors
Message-ID: <20260708074948.GA32452@lst.de>
References: <20260707220450.1200943-1-joannelkoong@gmail.com> <20260707220450.1200943-2-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707220450.1200943-2-joannelkoong@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
